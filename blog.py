import requests

url = "https://gitee.com/NaisWang/NaisWang/pages/rebuild"

ua_header = {
	'Connection': 'keep-alive',
	'Cache-Control': 'no-cache',
	'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, '
				  'like Gecko) Chrome/79.0.3945.88 Safari/537.36',
	'Origin': 'https://gitee.com',
	'Referer': 'https://gitee.com/NaisWang/NaisWang/pages/',
	'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
	'Cookie': 'oschina_new_user=false; user_locale=zh-CN; tz=Asia%2FShanghai; '
			  'Hm_lvt_24f17767262929947cc3631f99bfd274=1577284086,1577284864; '
			  'remember_user_token'
			  '=BAhbB1sGaQPd9iBJIiIkMmEkMTAkQ044cE9LZzNNS3l5VGpqZzhYbS9yZQY6BkVU'
			  '--ead7bb2b247f768c40bfefc9eb0c09e30625bb17; remote_way=ssh; '
			  'Hm_lpvt_24f17767262929947cc3631f99bfd274=1577287437; '
			  'gitee-session-n'
			  '=BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiJTk2OTFlMWQ2Y2NkMjcxNTViY2EzNWI2NzEyOTJhM2Q5BjsAVEkiGXdhcmRlbi51c2VyLnVzZXIua2V5BjsAVFsHWwZpA932IEkiIiQyYSQxMCRDTjhwT0tnM01LeXlUampnOFhtL3JlBjsAVEkiHXdhcmRlbi51c2VyLnVzZXIuc2Vzc2lvbgY7AFR7BkkiFGxhc3RfcmVxdWVzdF9hdAY7AFRJdToJVGltZQ0v7x3A5NmKXwk6DW5hbm9fbnVtaQGkOg1uYW5vX2RlbmkGOg1zdWJtaWNybyIHFkA6CXpvbmVJIghVVEMGOwBGSSIQX2NzcmZfdG9rZW4GOwBGSSIxUHl5cE9mUUVMcHp2dkVnUnhxVG5BMzZwUG5QUU5mZk5Ld1lyUGFkNjVTQT0GOwBG--d2927935928fb85ea9bcd898498a7663c2efc8f6',
	'Host': 'gitee.com',
	'Sec-Fetch-Mode': "cors",
	'Sec-Fetch-Site': 'same-origin',
	'X-CSRF-Token': 'PyypOfQELpzvvEgRxqTnA36pPnPQNffNKwYrPad65SA=',
	'X-Requested-With': 'XMLHttpRequest'
}

res = requests.post(url=url,
					data={'branch': 'master', 'build_directory': '', 'force_https': 'true'},
					headers=ua_header)

text = res.text
print(text)
if "服务仅供博客" not in text:
	print('\033[0;31;31mDeployment failure \033')
else:
	print('\033[0;31;32mDeployment success \033')
