# kill the zsh whose CPU is too high after closing the terminal
import psutil
import os
import signal
import time

_timer = getattr(time, 'monotonic', time.time)
num_cpus = psutil.cpu_count() or 1

def timer():
    return _timer() * num_cpus


pid_cpuinfo = {}


def GetProcessCPU_Pre(id):
    p = psutil.Process(id)
    pt = p.cpu_times()
    st1, pt1_0,pt1_1 = timer(),pt.user, pt.system   # new
    st0,pt0_0,pt0_1 = pid_cpuinfo.get(id,(0,0,0)) # old
 
    delta_proc = (pt1_0 - pt0_0) + (pt1_1 - pt0_1)
    delta_time = st1 - st0
    try:
        cpus_percent = ((delta_proc / delta_time) * 100)
    except:
        cpus_percent = 0.0
    pid_cpuinfo[id] = [st1, pt1_0, pt1_1]
    return "{:.3f}".format(cpus_percent)

pidss = psutil.pids()

kill_pids =[]

for pid in pidss:
    process_name = psutil.Process(pid).name()
    process_CPU = GetProcessCPU_Pre(pid)
    if (process_name == 'zsh'):
        if float(process_CPU) > 0.1:
            kill_pids.append(pid)
            
for pid in kill_pids:
    os.kill(pid, signal.SIGKILL)


print("kill count: " + str(len(kill_pids)))
