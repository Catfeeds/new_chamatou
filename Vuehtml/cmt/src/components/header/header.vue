<template>
  <div  id="main" class=" w100">
    <div class="contnav flex">
      <div class="left" style="font-size:18px; color:#8c7e70; line-height:78px; height: 78px; font-weight:bold; padding-left:20px;color: #fff">
        {{getStoreInfo.sp_name}}的茶楼 - <span id="navstr">营业</span>
      </div>
      <div class="marquee flex-1"  style="    font-size: 14px;
    color: #fff;
    line-height: 78px;
    padding: 0 0 0 20px;
    font-weight: 400;height:78px;width: 300px">
        <marquee style="display: none" direction="left" onmouseout="this.start()" onmouseover="this.stop()" scrollamount="6">
        v2.6.0版本更新内容：1、会员的服务费折扣设置；2、系统性能优化。更多详情，请关注微信公众号“茗匠门店管理系统”。
        <a class="mqclose" href="javascript:void(0);" title="关闭"></a>
      </marquee>
      </div>
      <div class="navinfo thin-scroll right">
        <div class="message"  v-if="role.information">
          <router-link to="/content/information" tag="a" style="color: #fff">消息</router-link>
          <i v-if="noMsg!=0 " style="left:80px;">{{noMsg}}</i>
        </div>
        <div class="user showlist" @mouseover="nnn(1)"  @mouseout="nnn(2)">
          <a href="javascript:void(0)"  style="color: #fff">{{getUserInfo.user}}</a>
          <div class="dropdown r5px " :class="{ 'in' : classin }">
            <ul>
              <li><a href="javascript:void(0);" @click="userDetail()">账号信息</a></li>
              <li v-if="role.jiaoban"><a href="javascript:void(0);" @click="handWork()">交班</a></li>
              <li  v-if="role.jiaoban_list"> <router-link to="/content/handwork" tag="a" style="color: #fff">交班记录</router-link> </li>
              <li><a href="javascript:void(0);" @click="checkOut()">退出登录</a></li>
            </ul>
          </div>
        </div>
        <div class="shop ">
          <a  href="javascript:void(0)"  style="color: #fff">【{{getStoreInfo.sp_name}}】</a>
          <div class="dropdown   r5px">
            <ul>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--修改员工-->
    <div class="viewsmall form_cont r10px " id="editUsers">
      <div class="form_cap clearfix">
        <span class="fl">账号信息</span>
        <a class="close fr" href="javascript:void(0);" @click="close('editUsers')"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>手机号码：</td>
              <td>
              {{getUserInfo.phone}}
              </td>
            </tr>
            <tr>
              <td>员工姓名：</td>
              <td>
               {{getUserInfo.user}}
              </td>
            </tr>
            <tr>
              <td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
              <td>
                <input autofocus="true" placeholder="如需修改密码请输入密码" v-model='staffPwd' type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
            <tr v-if="staffPwd!=''">
              <td>原&nbsp;密&nbsp;&nbsp;码：</td>
              <td>
                <input autofocus="true" placeholder="请输入原密码" v-model='staffPwds' type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn" v-if="staffPwd!=''">
          <a  class="btngreen baocun" href="javascript:void(0);" @click="editStaff()">保存</a>
        </div>
      </div>
    </div>
    <!--交班班弹出框-->
    <div class="viewroom thin-scroll r10px work" id="works">
      <div class="viewbox r10px form_cont exchange">
        <div class="form_cap clearfix">
          <span class="fl">交接班</span>
          <a class="close fr" href="javascript:void(0)" @click="close('works')"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail">
          <div class="form_table">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td>当班时间：</td>
                <td colspan="3">
                  <span style=" position: relative">
                    <input v-model="statrTime" class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="txtHandoverCurrentBeginTime" @click="selectDate('#txtHandoverCurrentBeginTime');" type="text">
                  </span>
                  &nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;
                  <span style=" position: relative">
                    <input v-model="endTime" class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="txtHandoverCurrentEndTime" @click="selectDate('#txtHandoverCurrentEndTime');" type="text">
                  </span>
                </td>
              </tr>
              <tr>
                <td>交班员工：</td>
                <td style="width: 203px;">{{businessData.user}}</td>
                <td>上班留存：</td>
                <td><b> {{handwork==''? '0' : handwork}}元</b></td>
              </tr>
              <tr>
                <td>接班员工：</td>
                <td>
                  <select class="ng-untouched ng-pristine ng-valid" v-model="staffId" @change="getStaffName()">
                    <option value="0">请选择员工</option>
                    <option v-for="(staff,index) in staffList" :value="staff.id" v-if="staff.user!=businessData.user">{{staff.user}}</option>
                  </select>
                </td>
                <td>本班现金：</td>
                <td><b>{{businessData.money_pay}}元</b></td>
              </tr>
              <tr>
                <td>本班总额：</td>
                <td colspan="3"><b>{{businessData.sum}}元</b></td>
              </tr>
              </tbody>
            </table>
          </div>
          <div class="form_exchange">
            <div class="exchange_tab">
              <span @click="changeId=0" :class="{'current':changeId==0}">营业额(￥{{businessList.sum}}元)</span>
              <span @click="changeId=1" :class="{'current':changeId==1}">会员充值(￥{{vipData.sum}}元)</span>
            </div>
            <div v-show="changeId==0" class="globaltable r3px">
              <table border="0" cellpadding="0" cellspacing="0">
              <tbody>
              <tr>
               <td width="13%">
                现金
              </td>
                <td width="13%">
                Pos刷卡
              </td>
                <td width="13%">
                支付宝
              </td>
                <td width="15%">
                微信支付
              </td>
                <td width="15%">
                会员支付
              </td>
                <td width="15%">
                  手动优惠
                </td>
                <td width="15%">
                  茶豆币支付
                </td>
              </tr>
              <tr>
              <td><font color="#269969">{{businessList.money_pay}}元</font></td>
              <td><font color="#269969">{{businessList.card_pay}}元</font></td>
              <td><font color="#269969">{{businessList.ali_pay}}元</font></td>
              <td><font color="#269969">{{businessList.wx_pay}}元</font></td>
              <td><font color="#269969">{{businessList.vip_pay}}元</font></td>
              <td><font color="#269969">{{businessList.preferential}}元</font></td>
              <td><font color="#269969">{{businessList.beans_amount}}元</font></td>
                
              </tr>
              </tbody></table>
            
            </div>
            <div v-show="changeId==1" class="globaltable r3px">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody>
                <tr>
                  <td width="20%">
                    现金
                  </td>
                  <td width="20%">
                    Pos刷卡
                  </td>
                  <td width="20%">
                    支付宝
                  </td>
                  <td width="20%">
                    微信支付
                  </td>
                  <td width="20%">
                    赠送
                  </td>
                </tr>
                <tr>
                  <td><font color="#269969">{{vipData.money_pay}}元</font></td>
                  <td><font color="#269969">{{vipData.card_pay}}元</font></td>
                  <td><font color="#269969">{{vipData.ali_pay}}元</font></td>
                  <td><font color="#269969">{{vipData.wx_pay}}元</font></td>
                  <td><font color="#269969">{{vipData.zs}}元</font></td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="form_table">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td>上缴现金：</td>
                <td>
                 应缴现金<span style="color: red">{{businessData.money_pay}}</span>元
                </td>
                <td>留存现金：</td>
                <td>
                  {{handwork=='' ? '0' : handwork}}元
                </td>
              </tr>
              <tr class="remarks" valign="top">
                <td>备注：</td>
                <td colspan="3"><textarea v-model="remark" class="ng-untouched ng-pristine ng-valid" placeholder="如有其它可填写备注"></textarea></td>
              </tr>
              </tbody></table>
          </div>
          <div class="form_btn">
            <a class="dayins  " href="javascript:void(0)" @click="getReadyPrint()"><i></i>打印交班记录</a>&nbsp;&nbsp;
            <a class="btngreen jiaoban" href="javascript:void(0);" @click="addHandWork()">确认交班</a>
          </div>
        </div>
      </div>
    </div>
    <!--账单打印-->
    <div style="opacity: 0">
      <div   class="asdasd" id="divCustomerRechargePrints" >
        <div  style="padding: 15px;margin: 0;" >
          <!--主张单-->
          <div style="margin-top: 15px;">
            <h2 style="display:block; text-align:center; height:24px; overflow:hidden; margin:0; padding:0; line-height:24px;font-size: 16px;">
              交班记录单
            </h2>
            <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed;padding-bottom:15px; width:100%;margin-top: 10px;">
              <tbody>
              <tr style="height: 30px">
                <td>开始时间：</td>
                <td>{{statrTime}}</td>
              </tr>
              <tr style="height: 30px">
                <td>结束时间：</td>
                <td>{{endTime}}</td>
              </tr>
              <tr style="height: 30px">
                <td>交班员工：</td>
                <td>{{businessData.user}}</td>
              </tr>
              <tr style="height: 30px">
                <td>交班时间：</td>
                <td>{{endTime}}</td>
              </tr>
              <tr style="height: 30px">
                <td>接班员工：</td>
                <td>{{StaffName}}</td>
              </tr>
              </tbody>
            </table>
            <h4 style="border-bottom:#666 1px dashed; display:block; text-align:center; height:30px; overflow:hidden; margin:0; padding:0; line-height:30px;font-size: 14px;">
              营业额
            </h4>
            <table border="0" cellpadding="0" cellspacing="0" style="color:#666;border-bottom:#666 1px dashed; padding-bottom:15px; width:100%; ">
              <tbody>
              <tr  style="height: 30px;" >
                <td>现金支付</td>
                <td style="width: 150px;">{{businessList.money_pay}}元</td>
              </tr>
              <tr  style="height: 30px;" >
                <td>刷卡支付</td>
                <td style="width: 150px;">{{businessList.card_pay}}元</td>
              </tr>
              <tr  style="height: 30px;" >
                <td>支付宝支付</td>
                <td style="width: 150px;">{{businessList.ali_pay}}元</td>
              </tr>
              <tr  style="height: 30px;" >
                <td>微信支付</td>
                <td style="width: 150px;">{{businessList.wx_pay}}元</td>
              </tr>
              <tr  style="height: 30px;" >
                <td>茶豆币支付</td>
                <td style="width: 150px;">{{businessList.beans_amount}}元</td>
              </tr>
              <tr  style="height: 30px;" >
                <td>会员支付</td>
                <td style="width: 150px;">{{businessList.vip_pay}}元</td>
              </tr>
              <tr  style="height: 30px;" >
                <td>手动优惠</td>
                <td style="width: 150px;">{{businessList.preferential}}元</td>
              </tr>
              </tbody>
            </table>
            <h4 style="border-bottom:#666 1px dashed; display:block; text-align:center; height:30px; overflow:hidden; margin:0; padding:0; line-height:30px;font-size: 14px;">
              会员充值
            </h4>
            <table border="0" cellpadding="0" cellspacing="0" style="color:#666;border-bottom:#666 1px dashed; padding-bottom:15px; width:100%; ">
              <tbody>
              <tr  style="height: 30px;" >
                <td>现金支付</td>
                <td style="width: 150px;">{{vipData.money_pay}}元</td>
              </tr>
              <tr  style="height: 30px;" >
                <td>刷卡支付</td>
                <td style="width: 150px;">{{vipData.card_pay}}元</td>
              </tr>
              <tr  style="height: 30px;" >
                <td>支付宝支付</td>
                <td style="width: 150px;">{{vipData.ali_pay}}元</td>
              </tr>
              <tr  style="height: 30px;" >
                <td>微信支付</td>
                <td style="width: 150px;">{{vipData.wx_pay}}元</td>
              </tr>
              <tr  style="height: 30px;" >
                <td>赠送</td>
                <td style="width: 150px;">{{vipData.zs}}元</td>
              </tr>
              </tbody>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" style="color:#666;border-bottom:#666 1px dashed; padding-bottom:15px; width:100%; ">
              <tbody>
              <tr  style="height: 30px;">
                <td >本班总额：</td>
                <td >{{businessData.sum}}元</td>
              </tr>
              <tr  style="height: 30px;">
                <td>上缴现金：</td>
                <td >{{businessData.money_pay}}元</td>
              </tr>
              <tr  style="height: 30px;">
                <td>留存现金：</td>
                <td >{{handwork==''? '0' : handwork}}元</td>
              </tr>
              <tr  style="height: 30px;">
                <td>备注：</td>
                <td >{{remark}}</td>
              </tr>
              </tbody>
            </table>
          </div>
          <!--主账单/end-->
          <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed; padding-bottom:15px; width:100%;">
            <tbody>
            <tr style="height: 30px;">
              <td>打印时间：</td>
              <td >{{printDate}}</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <!--账单打印、end-->
    <!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex';
  export default{
    data(){
      return {
        isLoading: false,
        iSsuccess:false,
        msgShow: false,
        msg: '',
        classin:false,
        handwork:'',
        staffList:[],
        staffId:0,
        statrTime: '',
        endTime: '',
        businessData:[],
        businessList:[],
        vipData:[],
        changeId:0,
        remark:'',
        printShow:false,
        StaffName:'',
        printDate:'',
        noMsg:'',
        staffPwd:'',
        staffPwds:'',
        role:[],
        getUserInfo: [],
        getStoreInfo: [],
        timer:'',
      }
    },
    computed:mapGetters(['getInit']),
    methods:{
    	//获取接班员工
      getStaffName(){
      	if(this.staffId!=0){
      		for (let i=0;i<this.staffList.length;i++){
      			if(this.staffList[i]['id']==this.staffId){
      				this.StaffName=this.staffList[i]['user'];
            }
          }
        }
      },
      //打印
      pr(){
        setTimeout(function(){
          $('#divCustomerRechargePrints').printArea();
        },500)
      },
      //点击打印
      getReadyPrint(){
        this.getDate();
      	this.pr();
      },
    	//保存交班信息
      addHandWork(){
      	var _this=this;
      	if(_this.staffId==0){
      		_this.msgHint('请选择交班员工');
      		return;
        }
        const data={
      		'auth_user_id':_this.staffId,
      		'note':_this.remark,
          'start_time':_this.statrTime,
          'end_time':_this.endTime
        };
      	_this.ajax(_this.port.addHandWork,data,'post',function (res) {
      		if(res.code==1){
      			_this.checkOut();
          }else{
            _this.msgHint(res.msg);
          }
        })
      },
    	//改变时间获取数据
      changeDate(s,e){
        var _this=this;
        _this.ajax(_this.port.handworkInit,{'start_time':s,'end_time':e},'get',function (res) {
          if(res.code==1){
            _this.businessData=[];
            _this.businesslist=[],
            _this.vipData=[],
            _this.businessData=res.data;
            _this.businessList=res.data.business;
            _this.vipData=res.data['vip'];
          }
        })
      },
      //时间插件
      selectDate(elem){
        var _this = this;
        var minData = laydate.now();
        laydate({
          elem: elem,
          istime: true,
          istoday: false,
          isclear:false,
          format: 'YYYY-MM-DD hh:mm',
          choose: function (dates) { //选择好日期的回调
          //  var myDate = _this.initDate(dates);
            if (elem == '#txtHandoverCurrentBeginTime') {
              //_this.statrTime = myDate.statrTime;
              _this.statrTime = dates;
            }else{
             // _this.endTime = myDate.endTime;
              _this.endTime = dates;
            }
            _this.changeDate(_this.statrTime,_this.endTime);
          }
        });
      },
      //初始化时间
      initDate(dates){
        var result = {};
        var startTime = '';
        var myDate;
        if (dates) {
          var date1 = dates.split(' ');
          var date2 = date1[0].split('-');
          var date3 = date1[1].split(':');
          var Y = parseInt(date2[0]);
          var M = parseInt(date2[1]) - 1;
          var D = parseInt(date2[2]);
          var H = parseInt(date3[0]);
          var I = parseInt(date3[1]);
          var S = parseInt(date3[2]);
          result.statrTime = dates;
          var endTime = this.getAddDate(Y, M, D, H, I, 10);
          result.endTime = endTime;
        } else {
          myDate = new Date();
          var Y = myDate.getFullYear();
          var M = myDate.getMonth() + 1;
          var D = myDate.getDate();
          var H = myDate.getHours();
          var I = myDate.getMinutes();
          var S = myDate.getSeconds();
          startTime += Y + '-';
          (M < 10) ? startTime += "0" + M + '-' : startTime += M + '-';
          (D < 10) ? startTime += "0" + D + ' ' : startTime += D + ' ';
          startTime +='05:00'
            result.statrTime = startTime;
          var endTime = this.getAddDate(Y, myDate.getMonth(), D, H, I, 10);
          result.endTime = endTime;
        }
        return result;
      },
      //获取加十分钟的结束时间
      getAddDate(y, m, d, h, i, num){
        var endTime = '';
        var myDate = new Date(y, m, d, h, i);
        myDate.setMinutes(myDate.getMinutes() + num);
        var Y = myDate.getFullYear();
        var M = myDate.getMonth() + 1;
        var D = myDate.getDate();
        var H = myDate.getHours();
        var I = myDate.getMinutes();
        var S = myDate.getSeconds();
        endTime += Y + '-';
        (M < 10) ? endTime += "0" + M + '-' : endTime += M + '-';
        (D < 10) ? endTime += "0" + D + ' ' : endTime += D + ' ';
        (H < 10) ? endTime += "0" + H + ':' : endTime += H + ':';
        (I < 10) ? endTime += "0" + I + ':' : endTime += I + ':';
        (S < 10) ? endTime += "0" + S  : endTime += S ;
        return endTime;
      },
    	//交班弹出框
      handWork(){
        $('.work').addClass('in');
      	$('.bgblack').addClass('in');
        this.staffInit();
        this.handWOrkInit();
        var myDate = this.initDate();
        this.statrTime=myDate.statrTime;
        this.endTime=myDate.endTime;
        this.initData();
      },
      //账号信息
      userDetail(){
        $('#editUsers').addClass('in');
        $('.bgblack').addClass('in');
      },
      //关闭交班弹出框
      close(id){
        var id = '#'+id;
        $(id).removeClass('in');
        $('.bgblack').removeClass('in');
      },
      //切换下拉框
      nnn(m){
         if(m==1){
           this.classin=true;
         }else{
           this.classin=false;
         }
      },
      //初始化员工信息
      staffInit(){
      	var _this=this;
        this.ajax(this.port.begin,{},'get',function (res) {
          if(res.code==1){
            _this.staffList=[];
            _this.staffList=res.data;
          }
        })
      },
      //初始化留存金额
      handWOrkInit(){
        var _this=this;
        _this.ajax(_this.port.handWork,{},'get',function (res) {
          if(res.code==1){
          	if(res.data){
              _this.handwork=res.data.value;
            }
          }
        })
      },
      //初始化营业数据
      initData(){
      	var _this=this;
      	_this.ajax(_this.port.handworkInit,{'start_time':_this.statrTime,'end_time':_this.endTime},'get',function (res) {
          if(res.code==1){
            _this.businessData=[];
            _this.businesslist=[],
              _this.vipData=[],
              _this.businessData=res.data;
            _this.businessList=res.data.business;
            _this.vipData=res.data['vip'];
          }
        })
      },
      //获取当前时间
      getDate(){
        var result='';
        var myDate = new Date();
        var Y = myDate.getFullYear();
        var M = myDate.getMonth() + 1;
        var D = myDate.getDate();
        var H = myDate.getHours();
        var I = myDate.getMinutes();
        var S = myDate.getSeconds();
        result += Y + '-';
        (M < 10) ? result += "0" + M + '-' : result += M + '-';
        (D < 10) ? result += "0" + D + ' ' : result += D + ' ';
        (H < 10) ? result += "0" + H + ':' : result += H + ':';
        (I < 10) ? result += "0" + I +':'  : result += I + ':';
        (S < 10) ? result += "0" + S  : result += S ;
        this.printDate=result;
      },
      //获取消息
      getMessages(){
          var _this=this;
          _this.ajax(_this.port.messages,{},'get',function (res) {
          	if(res.code==1){
          		if(res.data.length!=0){
          			var datalist=res.data;
                for(let i=0;i<datalist.length;i++){
                  (function(){
                  	setTimeout(function () {
                      var title,msg,types;
                      if(datalist[i]['type']==1){
                      }else if(datalist[i]['type']==2){//
                        title='点单提示'
                        msg=datalist[i]['content'];
                        types='success';
                      }else if(datalist[i]['type']==3){
                        title='预定提示'
                        msg=datalist[i]['content'];
                        types='warning';
                      }
                      _this.$notify({
                        title: title,
                        message: msg,
                        duration: 0,
                        customClass:'messageinfo',
                        type:types
                      });
                    },500)
                  })()
                }
              }
            }
          },false)
      },
      //获取总消息数据
      getCunt(){
        var _this = this;
        _this.ajax(_this.port.information,{},'get',function(res){
          if(res.code==1){
            _this.noMsg='';
              _this.noMsg =res.data.unread;
          }else{
            _this.msgHint(res.msg);
          }
        },false)
      },
      //修改密码
      editStaff(){
      	const _this=this;
      	if(_this.staffPwd==''){
      		_this.msgHint('请输入你要修改的密码');
      		return;
        }
        if(_this.staffPwds==''){
          _this.msgHint('请输入当前账户密码');
      		return;
        }
      	_this.ajax(_this.port.editPwd,{old_password:_this.staffPwds,new_password:_this.staffPwd},'post',function (res) {
          if(res.code==1){
            _this.checkOut();
          }else{
          	_this.msgHint(res.msg);
          }
        })
      },
       //退出登录
      checkOut(){
      	const _this=this;
      	_this.ajax(_this.port.loginOut,{},'post',function (res) {
          if(res.code==1){
          	_this.$store.commit('clearLogin');
            window.sessionStorage.clear('islogin');
            window.sessionStorage.clear('roledata');
            window.sessionStorage.clear('userinfo');
            window.sessionStorage.clear('storeinfo');
            _this.$router.push({path:'/login'});
          }else{
          	_this.msgHint(res.msg);
          }
        })
      }
    },
    mounted(){
    	var _this=this;
      setTimeout(function () {
        _this.role=_this.getInit['roleData']['common'];
        _this.getUserInfo=_this.getInit['userInfo'];
        _this.getStoreInfo=_this.getInit['storeInfo'];
      },800)
    	this.staffInit();
    	this.handWOrkInit();
    	_this.getCunt();
    	var myDate = this.initDate();
      this.statrTime=myDate.statrTime;
      this.endTime=myDate.endTime;
      this.initData();
      this.timer=setInterval(function (){
       _this.getMessages();
       _this.getCunt();
     },25000)
    },
    destroyed(){
      clearInterval(this.timer);
    }
  }
</script>
