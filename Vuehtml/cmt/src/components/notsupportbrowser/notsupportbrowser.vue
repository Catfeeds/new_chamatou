<template>
  <div>
    <div>
      <div class="index_warning_box">
        <p class="index_warning">抱歉，您当前使用的浏览器版本过低，建议您下载以下浏览器进行登录！</p>
        <div class="index_warning_browser">
          <ul class="">
            <li>
              <a href="http://rj.baidu.com/soft/detail/14744.html" target="_blank">
              <img src="http://res.mjzhcl.com/images/chrome.png" width="100" height="100">
              <span>Chrome&nbsp;&nbsp;前往下载</span>
             
              </a>
            </li>
            <li>
              <a href="http://rj.baidu.com/soft/detail/11843.html" target="_blank">
                <img src="http://res.mjzhcl.com/images/firefox.png" width="100" height="100">
                <span>FireFox&nbsp;&nbsp;前往下载</span>
              </a>
            </li>
            <li>
              <a href="http://se.360.cn/" target="_blank">
                <img src="http://res.mjzhcl.com/images/360.png" width="100" height="100">
                <span>360浏览器&nbsp;&nbsp;前往下载</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
  .index_warning_box{
    width: 80%;
    height:150px;
    position: fixed;
    left: 0;
    right:0;
    top:0;
    bottom:0;
    margin: auto;
  }
  .index_warning{
    font-size: 18px;text-align: center;
  }
  .index_warning_browser ul{
    overflow: hidden;
    text-align: center;
    width: 720px;
    margin: auto;
    padding-top: 35px;
  }
  .index_warning_browser ul li{
    float:left;
    display: block;
    width: 240px;
    line-height: 70px;
  }
  .index_warning_browser ul li img{width: 70px;height:70px;}
</style>

