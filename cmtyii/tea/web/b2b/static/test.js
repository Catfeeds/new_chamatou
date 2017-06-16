$(function() {


    //根据条件得到年月日星期几的字符串
    var str = getLocalTime("2017-02-22");
    var strs= new Array(); //定义一数组
    strs=str.split("-");  //切割字符串
    var Year = parseInt(strs[0]);//当前年份
    var Month =  parseInt(strs[1]) ;//当前月份
    var Day = parseInt(getDaysInMonth(strs[1],strs[0]));//当前月份天数
    var date_day = parseInt(strs[2]);
    var Week = parseInt(strs[3]);//星期几
    //计算遍历多少行
    //计算公式   （起止日期之差+开始时间的日期所在的星期几） / 7，四舍五入取整
    var stop_date_str =  getLocalTime(end_date);
    var strs_line= new Array(); //定义一数组
    strs_line=stop_date_str.split("-");  //切割字符串
    var stop_date = parseInt(strs_line[2]);//获取日期
    var stop_Month = parseInt(strs_line[1]);//获取月份
    if(Month<stop_Month){
        var num = stop_date + (Day - date_day) + Week;//得到起止日期和星期几的和
    }else{
        var num = stop_date - date_day + Week;//得到起止日期和星期几的和
    }
    var data_line = Math.round(parseInt(num)/7);//四舍五入取整
    //上一个月份
    var iPrevMonth = Month - 1;
    if (iPrevMonth <= 0) {
        Year--;
        iPrevMonth = 12; // set to December
    }
    //上一个月份
    var iNextMonth = Month + 1;
    if (iNextMonth > 12) {
        Year++;
        NextMonth = 1;
    }
    //获取上一个月的天数
    var iPrevDaysInMonth = getDaysInMonth(iPrevMonth,Year);
    //拼接上一个月一号的字符串
    var Prevdate_str = Year+"-"+Month+"-1";
    var PrevDay_str= getLocalTime(Prevdate_str);
    var strs_day= new Array(); //定义一数组
    strs_day=PrevDay_str.split("-");  //切割字符串
    //获取上一个月1号是星期几
    var iFirstDayDow = parseInt(strs_day[3]);
    //设置前一个月从那一天开始
    var iPrevShowFrom = iPrevDaysInMonth - iFirstDayDow + 1;
    // 判断上个月上一个1号是不是星期天
    var bPreviousMonth = (iFirstDayDow > 0);
    //if(bPreviousMonth > 0){
    var iCurrentDay = date_day - Week;
    //}else{
    // var iCurrentDay = 1;
    //}
    var bNextMonth = false;
    //返回时间年月日字符串
    function getLocalTime(nS) {
        var date = new Date(nS);
        var str_time="";
        str_time+= date.getFullYear()+'-'; //获取完整的年份(4位,1970-????)
        str_time+=date.getMonth()+1+'-'; //获取当前月份(0-11,0代表1月)
        str_time+=date.getDate()+'-'; //获取当前日(1-31)
        str_time+=date.getDay();//星期几
        return str_time;
    }
    function getLocalTimes(nSs) {
        var date = new Date(nSs);
        var str_times=date.getDate(); //获取当前日(1-31)
        return str_times;

    }
    //切换后的日期函数
    function getLocalTime_list(nS) {
        var date = new Date(nS);
        var Month = date.getMonth()+1;
        var Year = date.getFullYear();
        var Dayss = getDaysInMonth(Month,Year);
        var str_time="";
        str_time+= date.getFullYear()+'-';
        if(Dayss <= date.getDate() ){
            str_time+=(date.getMonth()<9) ? "0"+(date.getMonth()+2)+'-' : date.getMonth()+1+'-';
            str_time+="01";
        }else{
            str_time+=(date.getMonth()<9) ? "0"+(date.getMonth()+1)+'-' : date.getMonth()+1+'-';
            str_time+=(date.getDate()<9) ? "0"+(date.getDate()+1) : (date.getDate()+1); //获取当前日(1-31)
        }
        return str_time;
    }
    //返回月份天数
    function getDaysInMonth(month,year){
        var days;
        if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12) days=31;
        else if (month==4 || month==6 || month==9 || month==11 ) days=30;
        else if (month==2) {
            //判断是否为闰年
            if((year % 4 == 0 && year & 100 !=0) || year % 400 == 0){
                days=29;
            }else{
                days=28;
            }
        }
        return (days);
    }
    $.ajax({
        type: 'POST',
        data: {'start_date':start_dates,'end_date':end_dates,'ids':ids},
        url: './index.php?r=index/ajax',
        dataType:'json',
        success:function(json){
            //添加到页面中去
            var html ="";
            var k=-Week;
            var list = json.list;
            var strss="";
            var price ="";
            var count = json.count;
            $.each(list,function(index,array){
                strss+=getLocalTimes(array['date'].replace(/\-/g, "/"))+",";
                price+=array['price']+",";

            });
            var strsaaa= new Array(); //定义一数组
            var strsaaa_price= new Array(); //定义一数组
            strsaaa=strss.split(",");  //切割字符串
            strsaaa_price= price.split(",");

            //test
            $("#num_day").val(count);
            if(count>=15){
                $("#date-error").show();
                $("#date-error").html("<span>你选择的时间超过了14天</span>");

                $("#list_end").css({background:"red"});
            }

            html += "<tr id='th-tr'><td>星期天</td><td>星期一</td><td>星期二</td><td>星期三</td><td>星期四</td><td>星期五</td><td>星期六</td></tr>";
            for(var i=0;i<data_line+1;i++)
            {
                html += "<tr class='tr-date'>";

                for(var j=0;j<7;j++)
                {
                    var date_id = strsaaa[k];
                    var date_price =  strsaaa_price[k];
                    if(date_id == iCurrentDay){
                        html +="<td ><p>"+iCurrentDay+"</p><p style='color:red'><span>房价：</span>"+date_price+"</p></td>";
                    }else{
                        html +="<td style='color:red'>--</td>";
                    }


                    k++;
                    iCurrentDay++;
                    if (bPreviousMonth && iCurrentDay > Day) {
                        bPreviousMonth = false;
                        iCurrentDay = 1;
                    }
                    if (!bPreviousMonth && !bNextMonth && iCurrentDay>Day ) {
                        bNextMonth = true;
                        iCurrentDay = 1;
                    }
                }
                html +="</tr>";
            }

            $("#ajax").append(html);

        }
    });

});