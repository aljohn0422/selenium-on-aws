from selenium import webdriver


def handler(event, context):
    options = webdriver.ChromeOptions()
    options.binary_location = "/bin/headless-chromium"
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument("--disable-gpu")
    options.add_argument("--window-size=1280x1696")
    options.add_argument("--single-process")
    options.add_argument("--disable-dev-shm-usage")
    driver = webdriver.Chrome("/bin/chromedriver",
                              options=options)

    url = 'https://www.google.com'
    driver.get(url)
    print(driver.title)
    driver.quit()
    return 'done'


if __name__ == '__main__':
    handler(None, None)
