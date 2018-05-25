# import sys
# import re
# from urllib.parse import urlparse,parse_qs,urlencode
# from urllib.request import urlopen, urlretrieve
#
# url = "https://app.ubidots.com/ubi/datasources/#/detail/5ab7a35b76254221a2ebf8f2/variable/5ab7a35b76254221a2ebf8f6"
#
# def extract_values(url):
#     r = urlparse(url)
#     with urlopen(url) as val:
#         global contents
#         contents = val.read().decode("utf-8")
#     return contents
#
# print(extract_values(url))
#
# s = requests.Session()
# req = s.get(url)
# html = req.text

from selenium import webdriver
from time import sleep
from bs4 import BeautifulSoup
import re
email = "ggoowlgns@naver.com"
start_date = "2018-05-20"
end_date = "2018-05-24"

mot_url_list = ["https://app.ubidots.com/ubi/datasources/#/detail/5ab7a35b76254221a2ebf8f2/variable/5ab7a35b76254221a2ebf8f6",
                "https://app.ubidots.com/ubi/datasources/#/detail/5abb4bad7625425511cd7909/variable/5b0200ef5916360a106333f3",
                "https://app.ubidots.com/ubi/datasources/#/detail/5abb4c607625425b6a7c6df1/variable/5abb4c657625425b6a7c6e45",
                "https://app.ubidots.com/ubi/datasources/#/detail/5abddd2676254212730f5d8e/variable/5abddd2976254212730f5dba"]

def extract_csv():
    # Export CSV 클릭하기
    sleep(2)
    driver.find_element_by_xpath("/html/body/div[2]/div[4]/div/div[1]/div/div[2]/ul/li[4]/i").click()
    driver.find_element_by_xpath("/html/body/div[2]/div[4]/div/div[1]/div/div[2]/ul/ul/li[1]/a").click()
    driver.find_element_by_id("email").clear()
    driver.find_element_by_id("startDate").clear()
    driver.find_element_by_id("endDate").clear()

    driver.find_element_by_id("email").send_keys(email)
    driver.find_element_by_id("startDate").send_keys(start_date)
    driver.find_element_by_id("endDate").send_keys(end_date)

    driver.find_element_by_xpath("/html/body/div[1]/div/div/div[3]/div/div[2]/button").click()
    sleep(2)

url = "https://app.ubidots.com/accounts/signin/"
# Chrome의 경우 | 아까 받은 chromedriver의 위치를 지정해준다.
# driver = webdriver.Chrome('C:/Users/JiHoon/Desktop/JH/HanWang_CabStone/chromedriver.exe')
# PhantomJS의 경우 아까 받은 PhantomJS의 위치를 지정해준다.
driver = webdriver.PhantomJS('C:/Users/JiHoon/Desktop/JH/HanWang_CabStone/phantomjs-2.1.1-windows/bin/phantomjs.exe')

# 암묵적으로 웹 자원 로드를 위해 3초까지 기다려 준다.
driver.implicitly_wait(3)
# url에 접근한다.
driver.get(url)
#Entering id and password
driver.find_element_by_name('identification').send_keys('gigeon')
driver.find_element_by_name('password').send_keys('159753')

#로그인 buttton click
driver.find_element_by_xpath('//*[@id="signin"]/form/button').click()


for mot in mot_url_list:
    driver.get(mot)
    # 암묵적으로 웹 자원 로드를 위해 3초까지 기다려 준다.

    extract_csv() #csv 추출
    driver.implicitly_wait(3000)
    # html = driver.page_source
    # soup = BeautifulSoup(html, 'html.parser')
    # notices = soup.select(
    #     'body > div.ubi-content > div.container-fluid.col-fluid > div > div.col-md-9.variable-values-detail.ng-scope > div.col-xs-12.col-md-11.col-fluid.clearfix > div > section.table > table > tbody > tr:nth-child(2)')
    # print(notices)

url_collect= ""

# for n in notices:
#     print(n.next.strip())


