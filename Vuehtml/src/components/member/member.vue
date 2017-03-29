<template>
<div>
    <div class="contview">
          <div class="contviewtab">
              <a href="javascript:void(0);" class="current" @click="navclick('')" id="nav">会员管理</a>
              <a href="javascript:void(0);" @click="navclick('2')" id="nav2">充值记录查询</a>
              <a href="javascript:void(0);" @click="navclick('3')" id="nav3">消费记录查询</a>
            <div class="cvtab_button fr">
              <div>
                <a class="btngreen addmember r3px smallbtn" href="javascript:void(0);" @click="popup('a')">新增会员</a>
              </div>
            </div>
          </div>
          <!--会员管理-->
          <div class="bench white-scroll member" id="globaltable" style="display: block;">
              <div class="globaltable r5px white-scroll"  >
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr>
                    <td>会员姓名</td>
                    <td width="8%">性别</td>
                    <td width="10%">会员生日</td>
                    <td width="8%">状态</td>
                    <td width="8%">会员级别</td>
                    <td width="8%">商品折扣</td>
                    <td width="8%">包间折扣</td>
                    <td width="8%">余额</td>
                    <td width="10%">手机号</td>
                    <td width="10%">会员卡号</td>
                    <td>操作</td>
                  </tr>
                  <tr class="table_search">
                    <td><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td>
                      <select class="ng-untouched ng-pristine ng-valid">
                        <option value="-1">全部</option>
                        <option value="1">男</option>
                        <option value="2">女</option>
                      </select>
                    </td>
                    <td>
                      <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="dateCrmlistBirthDay" style="width: 120px;" type="text" @click="selectDate('#dateCrmlistBirthDay')">
                    </td>
                    <td>
                      <select class="ng-untouched ng-pristine ng-valid">
                        <option value="0">全部</option>
                        <option value="1">是</option>
                        <option value="2">否</option>
                    </select>
                    </td>
                    <td>
                        <select class="ng-untouched ng-pristine ng-valid">
                          <option value="0">全部</option>
                          <option >普通会员</option>
                          <option >8折会员</option>
                          <option >9折会员</option>
                          <option >活动折扣</option>
                      </select>
                    </td>
                    <td>--</td>
                    <td>--</td>
                    <td>--</td>
                    <td><input style="min-width:120px" type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td><input style="min-width:120px" type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td><a class="search r3px" href="javascript:void(0)"></a></td>
                  </tr>
                  </tbody>
                  <tbody>
                    <tr v-for="(data ,index) in memberList.data">
                        <td>{{data.username}}</td>
                        <td>{{data.sex}}</td>
                        <td>{{data.birthday}}</td>
                        <td>
                          <span class="colorgreen">正常</span>
                        </td>
                        <td>普通会员</td>
                        <td>无折扣</td>
                        <td>无折扣</td>
                        <td>{{data.total_amount}}</td>
                        <td>{{data.phone}}</td>
                        <td>{{data.card_no}}</td>
                        <td>
                          <a href="javascript:void(0)"  @click="recharge('b',data.id)">充值</a>
                          <span><a href="javascript:void(0)" @click="popup('c')">停用</a></span>
                        </td>
                    </tr>
                  </tbody>
                  <tbody>
                    <tr>
                      <td colspan="11">
                        <div>
                          <div class="page clearfix">
                           <div class="text">共<b>1</b>页<b>2</b>条记录</div>
                            <div class="linklist">
                              <a class="prev" href="javascript:void(0)">&nbsp;</a>
                              <a href="javascript:void(0)" class="current">1</a>
                              <a class="next" href="javascript:void(0)">&nbsp;</a>
                            </div>
                          </div>
                        </div>
                      </td>
                    </tr>
                </tbody>
                </table>
              </div>
            </div>
          <!--会员管理/end-->
          <!--会员详细信息-->
          <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">会员详细信息</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="theinfo">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>会员编号：</td>
                    <td>20170301346541</td>
                    <td>会员姓名：</td>
                    <td>张三</td>
                  </tr>
                  <tr>
                    <td>会员手机：</td>
                    <td>18030450804</td>
                    <td>会员卡号：</td>
                    <td>20170301346541</td>
                  </tr>
                  <tr>
                    <td>会员等级：</td>
                    <td>9折会员</td>
                    <td>会员性别：</td>
                    <td>男</td>
                  </tr>
                  <tr>
                    <td>商品折扣：</td>
                    <td>9.0折</td>
                    <td>包间折扣：</td>
                    <td>9.0折</td>
                  </tr>
                  <tr>
                    <td>联系地址：</td>
                    <td></td>
                    <td>启用密码：</td>
                    <td>否</td>
                  </tr>
                  <tr>
                    <td>会员余额：</td>
                    <td>0.0</td>
                    <td>服 务 生：</td>
                    <td>琳琳</td>
                  </tr>
                  <tr>
                    <td>会员生日：</td>
                    <td>2017-03-01</td>
                    <td>会员状态：</td>
                    <td>正常</td>
                  </tr>
                  <tr>
                    <td>会员备注：</td>
                    <td colspan="3"></td>
                  </tr>
                </tbody></table>
              </div>
              <div class="theinfo_tbl">
              </div>
            </div>
            <div class="dwdtl_btn">
              <a class="roominfo sidelink" href="javascript:void(0)">设置支付密码</a>
              <a class="btngreen fr xinzeng" href="javascript:void(0)">修改资料</a>
              <div class="clear"></div>
            </div>
          </div>
          <div class="bgblack bgnone"></div>
          <!--会员详细信息/end-->
       <div class="viewsmall form_cont r10px">
          <div class="form_cap clearfix">
            <span class="fl">设置会员支付密码</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="form_detail">
            <div class="form_table">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td></td>
                  <td><label><input type="checkbox" class="ng-untouched ng-pristine ng-valid">启用密码</label></td>
                  <td colspan="2" style="text-align:left; padding:0;"></td>
                </tr>
                <tr>
                  <td>密码：</td>
                  <td><input id="iptMemberPasswordSet" placeholder="请输入密码" type="password" class="ng-untouched ng-pristine ng-valid">
                  </td>
                  <td colspan="2" style="text-align:left; padding:0;"></td>
                </tr>
                <tr>
                  <td>确认密码：</td>
                  <td><input id="iptMemberPasswordSetChkAgain" placeholder="请再次输入密码" type="password" class="ng-untouched ng-pristine ng-valid">
                  </td>
                  <td colspan="2" style="text-align:left; padding:0;"></td>
                </tr>
              </tbody></table>
            </div>
            <div class="form_prompt">用于使用会员卡余额消费。</div>
            <div class="form_btn">
              <a class="btngreen baocun" href="javascript:void(0);">保存</a>
            </div>
          </div>
        </div>
        <div class="feedback tst2s r5px">
        </div>
      <!--充值记录查询-->
      <div class="bench white-scroll member" id="globaltable2">
        <div class="globaltable r5px" >
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>会员姓名</td>
              <td width="10%">手机号</td>
              <td>充值前余额</td>
              <td width="8%">充值金额</td>
              <td width="12%">赠送金额</td>
              <td width="12%">充值时间</td>
              <td>充值员工</td>
              <td>操作</td>
            </tr>
            <tr class="table_search">
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td>
                --
              </td>
              <td>
                --
              </td>
              <td>
                --
              </td>
              <td>
                <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="dateCrmRechargeRecordListBeginRechargeTime" style="width: 120px;" type="text">
              </td>
              <td>
                --
              </td>
              <td>
                <a class="search r3px" href="javascript:void(0)"></a>
              </td>
            </tr>
            </tbody> <tbody style="font-weight: normal;">
          </tbody>
            <tbody><tr>
              <td colspan="8">
                <div></div>
                <div>
                <div class="page clearfix">
                  <div class="text">共<b>0</b>页<b>0</b>条记录</div>
                  <div class="linklist">
                    <a class="prev" href="javascript:void(0)">&nbsp;</a>
                    <a href="javascript:void(0)" class="current">1</a>
                    <a class="next" href="javascript:void(0)">&nbsp;</a>
                  </div>
                </div>
              </div>
              </td>
            </tr>
            </tbody></table>
        </div>
      </div>
      <!--消费记录查询-->
      <div class="bench white-scroll member" id="globaltable3">
    
        <div class="jymxtime" style="text-align: right;">
          <a class="search r3px">导出</a>
        </div>
        <div class="globaltable r5px"  >
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>结账单编号</td>
              <td width="20%">结账时间</td>
              <td>消费时长</td>
              <td>房间名称</td>
              <td>商品消费</td>
              <td>包间费用</td>
              <td width="10%">会员优惠</td>
              <td width="8%">手动优惠</td>
              <td>实付款</td>
              <td width="10%">是否免单</td>
              <td>会员姓名</td>
              <td>结账员工</td>
              <td>操作</td>
            </tr>
            <tr class="table_search">
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td>
                <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="iptCheckOutTimeBegin" style="width: 120px;" type="text">
                -
                <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="iptCheckOutTimeEnd" style="width: 120px;" type="text">
              </td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td>
                <input type="text" class="ng-pristine ng-valid ng-touched">
              </td>
              <td>
                <input type="text" class="ng-pristine ng-valid ng-touched">
              </td>
              <td>
                <select class="ng-untouched ng-pristine ng-valid">
                  <option value="0">全部</option>
                  <option value="1">是</option>
                  <option value="2">否</option>
                </select>
              </td>
              <td>--</td>
              <td>
                <select class="ng-untouched ng-pristine ng-valid">
                  <option value="0">请选择员工</option>
                  <option value="20170301346421">
                  琳琳
                </option>
                </select>
              </td>
              <td>
                <a class="search r3px" href="javascript:void(0)"></a>
              </td>
            </tr>
            </tbody> <tbody>
          <tr>
            <td>20170306365811</td>
            <td>2017-03-06 10:09:41</td>
            <td>
              0小时0分钟
            </td>
            <td>吧台消费</td>
            <td>30.0元</td>
            <td>0.0元</td>
            <td>0.0元</td>
            <td>0.0元</td>
            <td>30.0元</td>
            <td>否</td>
            <td>--</td>
            <td>琳琳</td>
            <td>-</td>
          </tr>
          <tr>
            <td colspan="13">
              <div></div>
              <div>
              <div class="page clearfix">
                <div class="text">共<b>1</b>页<b>1</b>条记录</div>
                <div class="linklist">
                  <a class="prev" href="javascript:void(0)">&nbsp;</a>
                  <a href="javascript:void(0)" class="current">1</a>
                  <a class="next" href="javascript:void(0)">&nbsp;</a>
                </div>
              </div>
            </div>
            </td>
          </tr>
          </tbody>
          </table>
        </div>
      </div>
        </div>
        <!--添加会员弹出层-->
        <div class="viewroom thin-scroll  ssss r10px " id="a" style="bottom: auto;">
          <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
          <div class="viewbox r10px form_cont">
            <div class="form_cap clearfix">
              <span class="fl">新增会员</span>
              <a class="close fr" href="javascript:void(0);" @click="close('a')"></a>
            </div>
            <div class="form_detail">
              <div class="form_table">
              
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td><em class="colorred">*&nbsp;</em>会员姓名：</td>
                    <td><input maxlength="20" type="text" class="ng-untouched ng-pristine ng-valid"  v-model="user"></td>
                    <td><em class="colorred">*&nbsp;</em>手机号码：</td>
                    <td><input maxlength="20" type="text" class="ng-untouched ng-pristine ng-valid" v-model="phone"></td>
                  </tr>
                  <tr>
                    <td>性别：</td>
                    <td>
                      <label><input name="customerAddSexRadios" type="radio" value="1" class="ng-untouched ng-pristine ng-valid"  v-model="sex" >男</label>
                      <label> <input name="customerAddSexRadios" type="radio" value="2" class="ng-untouched ng-pristine ng-valid"  v-model="sex"  >女</label>
                    </td>
                    <td>出生日期：</td>
                    <td>
                      <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="dateAddCrmBirthDay" type="text" v-model="birthday" @click="selectDate()">
                    </td>
                  </tr>
                  <tr>
                    <td>联系地址：</td>
                    <td colspan="3"><input style=" width:100%" type="text" class="ng-untouched ng-pristine ng-valid" v-model="address"></td>
                  </tr>
                  <tr class="remarks">
                    <td valign="top">备注：</td>
                    <td colspan="3"><textarea style=" width:100%" class="ng-untouched ng-pristine ng-valid" v-model="notes"></textarea></td>
                  </tr>
                  </tbody></table>
              </div>
              <div class="form_btn">
                <a class="btngreen baocun" href="javascript:void(0);" @click="addmember()">保存</a>
              </div>
            </div>
          </div>
        </div>
        <!--添加会员/end-->
        <!--会员充值弹出层-->
        <div class="viewroom thin-scroll r10px viewbillroom"  id="b">
          <div class="viewbox r10px form_cont">
            <div class="form_cap clearfix">
              <span class="fl">会员充值</span>
              <a class="close fr" href="javascript:void(0)" @click="close('b')"></a>
            </div>
            <div class="form_detail">
              <div class="form_list_cap mt10">会员资料</div>
              <div class="form_table mt10">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr>
                    <td>会员编号：</td>
                    <td width="34%">20170301346542</td>
                    <td>会员姓名：</td>
                    <td>活动折扣</td>
                  </tr>
                  <tr>
                    <td>手机号码：</td>
                    <td>11111111111</td>
                    <td>余额：</td>
                    <td><b>0.0</b>元</td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div class="bill_pay_box flex" style=" margin-bottom:30px;">
                <div class="bill_pay_list second  flex-1" style=" margin:0 20px 0 0 ;">
                  <h3>充值金额</h3>
                  <div class="bill_pay_tab">
                    <ul class="clearfix flex">
                      <li class="active money " >
                        <label class="r3px"></label>现金
                      </li>
                      <li class="money">
                        <label class="r3px "></label>Pos刷卡
                      </li>
                      <li class="money">
                        <label class="r3px"></label>支付宝
                      </li>
                      <li class="money">
                        <label class="r3px"></label>微信支付
                      </li>
                    </ul>
                  </div>
                  <div class="bill_pay_conts">
                    <div class="bill_input">
                      <input maxlength="9" placeholder="请输入金额" type="text" class="ng-untouched ng-pristine ng-valid">
                      &nbsp;&nbsp;元
                    </div>
                  </div>
                </div>
                <div class="bill_pay_list">
                  <h3>赠送金额</h3>
                  <div class="bill_pay_tab">
                    <ul class="clearfix flex">
                      <li class="active"><label class="r3px"></label>赠送金额</li>
                    </ul>
                  </div>
                  <div class="bill_pay_conts">
                    <div class="bill_input">
                      <input maxlength="9" placeholder="请输入金额" type="text" class="ng-untouched ng-pristine ng-valid">&nbsp;&nbsp;元
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="bill_statement" style=" position:static">
              <div class="price">
                <ul>
                  <li>充值总额：<b><font color="#e64c2e">0.0</font></b>元，赠送总额：<b><font color="#e64c2e">0.0</font></b>元
                  </li>
                </ul>
              </div>
              <div class="button flex">
                <div class="free_select flex-1">
                  <label><input type="checkbox" class="ng-untouched ng-pristine ng-valid">打印充值单</label>
                </div>
                <div class="bill_submit">
                  <a class="btngreen queding" href="javascript:void(0)">确定</a>
                </div>
              </div>
            </div>
          </div>
        </div>
         <!--停用弹出层-->
        <div class="viewwarning r10px " id="c">
          <div class="caption clearfix">
            <span class="fl">询问</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="conts">
            <p>您确认停用该会员吗？</p>
            <div class="button">
              <a href="javascript:void(0);" @click="close('c')">取消</a>
              <a class="btnred confirm r3px" href="javascript:void(0);" @click="close('c')">确定</a>
            </div>
          </div>
        </div>
  <div class="bgblack "></div>
  <!--弹出层End-->
  <!--loading-->
  <v-loading v-if="isLoading"></v-loading>
  <!--loading/end-->
  <div v-if="iSsuccess" class="bgblacks  in"></div>
         
</div>
</template>
<script>
    export default{
          data(){
            return {
              desk_No:'',
              isLoading: false,
              memberList:[],
              user:'',
              phone:'',
              birthday:'',
              sex:1,
              address:'',
              notes:'',
              msgShow: false,
              msg: ''
            }
          },
        methods: {
          // 弹出框显示隐藏
          popup (id){
          	this.birthday= this.initDate();
            var id = '#' + id;
            $(id).addClass('in');
            $('.bgblack').addClass('in');
          },
          close(id){
            var id = '#' + id;
            $(id).removeClass('in');
            $('.bgblack').removeClass('in');
          },
        //初始化时间
          initDate(){
            var startTime = '';
            var myDate;
              myDate = new Date();
              var Y = myDate.getFullYear();
              var M = myDate.getMonth() + 1;
              var D = myDate.getDate();
              startTime += Y + '-';
              (M < 10) ? startTime += "0" + M + '-' : startTime += M + '-';
              (D < 10) ? startTime += "0" + D : startTime += D ;
            return  startTime;
          },
//          导航切换
          navclick(id){
            var id = id;
            var bleid = '#globaltable' + id;
            var nav = '#nav' + id;
            $('.bench').hide();
            $('#nav').siblings('.current').removeClass('current').end().removeClass('current');
            $(bleid).show();
            $(nav).addClass('current');
          },
          //新加会员保存数据
          addmember(){
            var _this = this;
            if(_this.phone==''){
            	_this.msgHint('会员姓名不能为空');
            	return ;
            }
            if (!/^1(3[0-9]|4[57]|5[0-35-9]|7[013678]|8[0-9])[\d]{8}$/g.test(_this.phone)) {
              _this.msgHint('请填写正确手机号码');
              return;
            }
            const  data={
              username: _this.user,
              phone: _this.phone,
              address: _this.address,
              notes: _this.notes,
              birthday: _this.birthday,
              sex: _this.sex
            }
            this.ajax(this.port.addMember, data, "post", function (res) {
              if (res.code == 1) {
                _this.initData();
              } else {
                _this.msgHint(res.msg)
              }
            })
          },
          //时间插件
          selectDate(elem){
            var _this = this;
            laydate({
              elem: elem,
              choose: function (dates) {
                _this.birthday=dates;
              }
              });
          },
          //点击充值
          recharge(id, urlid){
            var id = '#' + id;
            $(id).addClass('in');
            $('.bgblack').addClass('in');
            var _this = this;
            var url = this.port.payMember;
            this.ajax(url, {id: urlid}, "get", function (res) {
              if (res.code == 1) {
                console.log(res);
              } else {
                alert(res.msg)
              }
            })
          },
          //初始化数据
          initData(){
            var _this=this;
            this.ajax(_this.port.memberData,{},"get",function (res) {
              _this. memberList=res;
              console.log(_this. memberList.data);
            })
          }
        },
        mounted(){
            $('.money').click(function(){
              $(this).addClass('active').siblings('.money').removeClass('active');
            });
          //初始化数据
          this.initData();
        }
    }
    
</script>
<style scoped>
     .bench{
       display:none;
       top:50px;
     }
</style>
