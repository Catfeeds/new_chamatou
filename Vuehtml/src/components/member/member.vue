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
                    <td width="10%">会员姓名</td>
                    <td width="10%">性别</td>
                    <td width="20%">会员生日</td>
                    <td width="10%">余额</td>
                    <td width="15%">手机号</td>
                    <td width="25%">会员卡号</td>
                    <td>操作</td>
                  </tr>
                  <tr class="table_search">
                    <td><input type="text" class="ng-untouched ng-pristine ng-valid" v-model="indexsearchUser"></td>
                    <td>--</td>
                    <td>--</td>
                    <td>--</td>
                    <td><input style="min-width:120px" type="text" class="ng-untouched ng-pristine ng-valid" v-model="indexsearchPhone"></td>
                    <td>--</td>
                    <td><a @click="Search('index');" class="search r3px" href="javascript:void(0)"></a></td>
                  </tr>
                  </tbody>
                  <tbody>
                    <tr v-for="(data ,index) in memberList.dateList" >
                        <td @click="getDetail(data.id);">{{data.username}}</td>
                        <td @click="getDetail(data.id);">{{data.sex}}</td>
                        <td @click="getDetail(data.id);">{{data.birthday}}</td>
                        <td @click="getDetail(data.id);">{{data.vip_amount}}</td>
                        <td @click="getDetail(data.id);">{{data.phone}}</td>
                        <td @click="getDetail(data.id);">{{data.card_no}}</td>
                        <td >
                          <a href="javascript:void(0)"  @click="recharge('b',data.id)"  >充值</a>
                          <span>
                                <a href="javascript:void(0)" @click="delMem(data.id)" >删除</a>
                          </span>
                        </td>
                    </tr>
                  </tbody>
                  <tbody v-if="searchShow">
                  <tr>
                    <td colspan="11">
                      <div>
                        <div class="page clearfix">
                          <div class="text">共<b>{{mempageInfo.pageCount}}</b>页<b>{{mempageInfo.dataCount}}</b>条记录</div>
                          <div class="linklist">
                            <a class="prev" href="javascript:void(0)" @click="changePage(page,'indexSearch','prev');" >&nbsp;</a>
                            <a href="javascript:void(0)"   v-for="(pages,index) in paegList"  :class="{'current' : (page==pages)}"   @click="changePage(pages,'indexSearch');" >{{pages}}</a>
                            <a class="next" href="javascript:void(0)" @click="changePage(page,'indexSearch','next');" >&nbsp;</a>
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                  </tbody>
                  <tbody v-if="!searchShow">
                    <tr>
                      <td colspan="11">
                        <div>
                          <div class="page clearfix">
                            <div class="text">共<b>{{mempageInfo.pageCount}}</b>页<b>{{mempageInfo.dataCount}}</b>条记录</div>
                            <div class="linklist">
                              <a class="prev" href="javascript:void(0)" @click="changePage(page,'index','prev');" >&nbsp;</a>
                              <a href="javascript:void(0)"   v-for="(pages,index) in paegList"  :class="{'current' : (page==pages)}"   @click="changePage(pages,'index');" >{{pages}}</a>
                              <a class="next" href="javascript:void(0)" @click="changePage(page,'index','next');" >&nbsp;</a>
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
          <div class="drawerdetail flex   flex-v" id="cc">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">会员详细信息</span>
                <a class="close fr" @click="close('cc')" href="javascript:void(0);"></a>
              </div>
              <div class="theinfo">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr>
                    <td>会员卡号：</td>
                    <td >{{memPayDetail.card_no}}</td>
                    <td>会员姓名：</td>
                    <td>{{memPayDetail.username}}</td>
                  </tr>
                  <tr>
                    <td>会员手机：</td>
                    <td>{{memPayDetail.phone}}</td>
                    <td>会员余额：</td>
                    <td>{{memPayDetail.vip_amount}}</td>
                  </tr>
                  <tr>
                    <td>会员生日：</td>
                    <td>{{memPayDetail.birthday}}</td>
                    <td>会员性别：</td>
                    <td>{{(memPayDetail.sex==1) ? '男' : '女'}}</td>
                  </tr>
                  <tr>
                    <td>联系地址：</td>
                    <td colspan="3">{{memPayDetail.address}}</td>
                  </tr>
                  <tr>
                    <td>会员备注：</td>
                    <td colspan="3">{{memPayDetail.notes}}</td>
                  </tr>
                </tbody></table>
              </div>
              <div class="theinfo_tbl">
              </div>
            </div>
            
          </div>
          <div class="bgblack bgnone"></div>
          <!--会员详细信息/end-->
        <div class="feedback tst2s r5px">
        </div>
      <!--充值记录查询-->
      <div class="bench white-scroll member" id="globaltable2">
        <div class="globaltable r5px" >
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td width="15%">会员姓名</td>
              <td width="15%">手机号</td>
              <td width="15%">会员卡号</td>
              <td width="10%">充值前余额</td>
              <td width="10%">充值金额</td>
              <td width="10%">赠送金额</td>
              <td width="10%">余额</td>
              <td>操作</td>
            </tr>
            <tr class="table_search">
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid" v-model="indexsearchUser">
              </td>
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid"  v-model="indexsearchPhone">
              </td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td>
                <a class="search r3px" href="javascript:void(0)" @click="Search('pay');"></a>
              </td>
            </tr>
            </tbody>
            <tbody style="font-weight: normal;">
          <tr v-for="(paylist,index) in payListData">
              <td>{{paylist.username}}</td>
            <td>{{paylist.phone}}</td>
              <td>{{paylist.card_no}}</td>
              <td>{{paylist.pay_up_amount}}元</td>
              <td>{{paylist.amount}}元</td>
              <td>{{paylist.zs}}元</td>
              <td>{{paylist.sum}}元</td>
              <td>
                <a href="javascript:void(0)"   @click="payListDetail(paylist.id)">查看</a>
                &nbsp;&nbsp;
                <a href="javascript:void(0)" @click="payListDetail(paylist.id,'print')">打印</a>
              </td>
            </tr>
            </tbody>
            <tbody v-if="searchShow">
            <tr>
              <td colspan="11">
                <div>
                  <div class="page clearfix">
                    <div class="text">共<b>{{mempageInfo.pageCount}}</b>页<b>{{mempageInfo.dataCount}}</b>条记录</div>
                    <div class="linklist">
                      <a class="prev" href="javascript:void(0)" @click="changePage(page,'paySearch','prev');" >&nbsp;</a>
                      <a href="javascript:void(0)"   v-for="(pages,index) in paegList"  :class="{'current' : (page==pages)}"   @click="changePage(pages,'paySearch');" >{{pages}}</a>
                      <a class="next" href="javascript:void(0)" @click="changePage(page,'paySearch','next');" >&nbsp;</a>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
            </tbody>
            <tbody v-if="!searchShow">
            <tr>
              <td colspan="11">
                <div>
                  <div class="page clearfix">
                    <div class="text">共<b>{{mempageInfo.pageCount}}</b>页<b>{{mempageInfo.dataCount}}</b>条记录</div>
                    <div class="linklist">
                      <a class="prev" href="javascript:void(0)" @click="changePage(page,'pay','prev');" >&nbsp;</a>
                      <a href="javascript:void(0)"   v-for="(pages,index) in paegList"  :class="{'current' : (page==pages)}"   @click="changePage(pages,'pay');" >{{pages}}</a>
                      <a class="next" href="javascript:void(0)" @click="changePage(page,'pay','next');" >&nbsp;</a>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
            </tbody>
          </table>
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
              <span class="fl" >新增会员</span>
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
          <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
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
                    <td width="34%">{{memPayDetail.card_no}}</td>
                    <td>会员姓名：</td>
                    <td>{{memPayDetail.username}}</td>
                  </tr>
                  <tr>
                    <td>手机号码：</td>
                    <td>{{memPayDetail.phone}}</td>
                    <td>余额：</td>
                    <td><b>{{memPayDetail.vip_amount}}</b>元</td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div class="bill_pay_box flex" style=" margin-bottom:30px;">
                <div class="bill_pay_list second  flex-1" style=" margin:0 20px 0 0 ;">
                  <h3>充值金额</h3>
                  <div class="bill_pay_tab">
                    <ul class="clearfix flex">
                      <li class="active money " @click="payTypeChange(1)" >
                        <label class="r3px" ></label>现金
                      </li>
                      <li class="money" @click="payTypeChange(2)">
                        <label class="r3px " ></label>Pos刷卡
                      </li>
                      <li class="money" @click="payTypeChange(3)">
                        <label class="r3px"></label>微信支付
                      </li>
                      <li class="money" @click="payTypeChange(4)">
                        <label class="r3px" ></label>支付宝
                      </li>
                    </ul>
                  </div>
                  <div class="bill_pay_conts">
                    <div class="bill_input">
                      <input maxlength="9" placeholder="请输入金额" type="text" class="ng-untouched ng-pristine ng-valid" v-model="payMoney">
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
                      <input maxlength="9" placeholder="请输入金额" type="text" class="ng-untouched ng-pristine ng-valid" v-model="zsMoney">&nbsp;&nbsp;元
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="bill_statement" style=" position:static">
              <div class="price">
                <ul>
                  <li>充值总额：<b><font color="#e64c2e">{{payMoney || '0.0'}}</font></b>元，赠送总额：<b><font color="#e64c2e">{{zsMoney || '0.0'}}</font></b>元
                  </li>
                </ul>
              </div>
              <div class="button flex">
                <div class="free_select flex-1">
                  <label><input type="checkbox" class="ng-untouched ng-pristine ng-valid"  v-model="printShow">打印充值单</label>
                </div>
                <div class="bill_submit">
                  <a class="btngreen queding" href="javascript:void(0)" @click="payConfirm(memPayDetail.id);">确定</a>
                </div>
              </div>
            </div>
          </div>
        </div>
         <!--停用弹出层-->
  <!--充值详细信息-->
  <div class="drawerdetail flex flex-v " id="ee">
    <div class="dwdtl-scroll white-scroll flex-1">
      <div class="dwdtl_name clearfix">
        <span class="fl">会员充值详情</span>
        <a class="close fr" @click="close('ee')" href="javascript:void(0);"></a>
      </div>
      <div class="theinfo">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody><tr>
            <td>充值单号：</td>
            <td>{{payMoneyData.pay_no}}</td>
            <td>充值时间：</td>
            <td>{{payMoneyData.add_time}}</td>
          </tr>
          <tr>
            <td>会员卡号：</td>
            <td>{{memPayDetail.card_no}}</td>
            <td>会员姓名：</td>
            <td>{{memPayDetail.username}}</td>
          </tr>
          <tr>
            <td>充前余额：</td>
            <td>{{memPayDetail.pay_up_amount}}元</td>
            <td>充值金额：</td>
            <td>{{memPayDetail.amount}}元</td>
          </tr>
          <tr>
            <td>赠送金额：</td>
            <td>{{memPayDetail.zs}}元</td>
            <td>会员余额：</td>
            <td>{{memPayDetail.sum}}元</td>
          </tr>
          <tr>
            <td>会员手机：</td>
            <td>{{memPayDetail.phone}}</td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="theinfo_tbl">
        <div class="globaltable r5px">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr style="border-bottom: #ccc 1px solid; font-weight: bold;">
              <td>付款方式</td>
              <td>金额(元)</td>
            </tr>
            <tr>
              <td>微信支付</td>
              <td>{{(payMoneyData.pay_type==3) ? payMoneyData.payMoeny : '0.0'}}元</td>
            </tr><tr>
              <td>支付宝</td>
              <td>{{(payMoneyData.pay_type==4) ? payMoneyData.payMoeny : '0.0'}}元</td>
            </tr><tr>
              <td>Pos刷卡</td>
              <td>{{(payMoneyData.pay_type==2) ? payMoneyData.payMoeny : '0.0'}}元</td>
            </tr><tr>
              <td>现金</td>
              <td>{{(payMoneyData.pay_type==1) ? payMoneyData.payMoeny : '0.0'}}元</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <!--充值详细信息/end-->
  <!--二次确认-->
  <div id='dd' class="viewsmall form_cont r10px   confirmshow ">
    <div class="form_cap clearfix">
      <span class="fl">确认删除？</span>
      <a class="close fr" @click="close('dd');" href="javascript:void(0);"></a>
    </div>
    <div class="form_detail">
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_table">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody>
          <tr>
            <td style="text-align: center" >您确定删除该会员吗？</td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="form_btn">
        <a class="btngreen baocun" href="javascript:void(0);"  @click="close('dd');"   style="width: 45%;float: right;background: #999;">取消</a>
        <a class="btngreen baocun" href="javascript:void(0);"  @click="delMemConfirm();"  style="width: 45%;float: left;">确定</a>
      </div>
    </div>
  </div>
  <!--二次确认/end-->
  <!--充值打印-->
  <div style="opacity: 0">
    <div   class="asdasd" id="divCustomerRechargePrint"   >
      <div style="padding: 15px;margin: 0;" >
        <h2 style="display:block; text-align:center; height:24px; overflow:hidden; margin:0; padding:0; line-height:24px;font-size: 16px;">会员充值回执单</h2>
        <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed;padding-bottom:15px; width:100%;margin-top: 10px;">
          <tbody>
          <tr>
            <td>充值单号：</td>
            <td  style="width: 150px;">{{payMoneyData.pay_no}}</td>
          </tr>
          <tr>
            <td>充值时间：</td>
            <td>{{payMoneyData.add_time}}</td>
          </tr>
          <tr>
            <td>会员卡号：</td>
            <td>{{memPayDetail.card_no}}</td>
          </tr>
          <tr>
            <td>会员姓名：</td>
            <td>{{memPayDetail.username}}</td>
          </tr>
          <tr>
            <td>会员手机：</td>
            <td>{{memPayDetail.phone}}</td>
          </tr>
          <tr>
            <td>充前余额：</td>
            <td>{{memPayDetail.vip_amount}}元</td>
          </tr>
          <tr>
            <td>充值金额：</td>
            <td>{{payMoneyData.payMoeny}}元</td>
          </tr>
          <tr>
            <td>会员余额：</td>
            <td>{{payMoneyData.totalMoeny}}元</td>
          </tr>
          </tbody></table>
        <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px solid; padding-bottom:15px; width:100%; margin-top: 10px;">
          <tbody><tr style="border-bottom: #ccc 1px solid; font-weight: bold;">
            <td>付款方式</td>
            <td style="width: 100px;">金额(元)</td>
          </tr>
          <tr style="border-bottom: #ccc 1px solid;" >
            <td>微信支付</td>
            <td>{{(payMoneyData.pay_type==3) ? payMoneyData.payMoeny : '0.0'}}元</td>
          </tr>
          <tr style="border-bottom: #ccc 1px solid;">
            <td>支付宝</td>
            <td>{{(payMoneyData.pay_type==4) ? payMoneyData.payMoeny : '0.0'}}元</td>
          </tr>
          <tr style="border-bottom: #ccc 1px solid;">
            <td>Pos刷卡</td>
            <td>{{(payMoneyData.pay_type==2) ? payMoneyData.payMoeny : '0.0'}}元</td>
          </tr>
          <tr style="border-bottom: #ccc 1px solid;">
            <td>现金</td>
            <td>{{(payMoneyData.pay_type==1) ? payMoneyData.payMoeny : '0.0'}}元</td>
          </tr>
          </tbody>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed; padding-bottom:15px; width:100%;margin-top: 10px;">
          <tbody><tr>
            <td>打印时间：</td>
            <td style="width: 150px;">{{payMoneyData.add_time}}</td>
          </tr>
          <tr style="height: 50px;">
            <td>会员签名：</td>
            <td></td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!--充值打印/end-->
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
              iSsuccess:false,
              isLoading: false,
              memberList:[],
              user:'',
              phone:'',
              birthday:'',
              sex:1,
              address:'',
              notes:'',
              msgShow: false,
              msg: '',
              page:1,
              paegList:[],
              mempageInfo:[],
              indexsearchUser:'',
              indexsearchPhone:'',
              searchShow:false,
              memPayDetail:[],
              payMoney:'',
              zsMoney:'',
              payType:1,
              delMemId:'',
              printShow:false,
              payMoneyData:{
              	add_time:'',
                pay_no:'',
                totalMoeny:0,
                payMoeny:0,
                pay_type:1,
                zs:0
              },
              payListData:[]
           
            }
          },
        methods: {
          // 弹出框显示隐藏
          popup (id){
            this.birthday = this.initDate();
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
            (D < 10) ? startTime += "0" + D : startTime += D;
            return startTime;
          },
//          导航切换
          navclick(id){
          	var _this=this;
            var id = id;
            var bleid = '#globaltable' + id;
            var nav = '#nav' + id;
            $('.bench').hide();
            $('#nav').siblings('.current').removeClass('current').end().removeClass('current');
            $(bleid).show();
            $(nav).addClass('current');
            if(id=2){
            	this.page=1;
              this.paegList = [];
              this.searchShow=false;
              this.mempageInfo = [];
            _this.ajax(_this.port.payList,{page:this.page},'GET',function(res){
              if(res.code==1){
      
                _this.payListData=res.data['dateList'];
                _this.mempageInfo = res.data.page;
                for (var i = 1; i <= res.data['page']['pageCount']; i++) {
                  _this.paegList.push(i);
                }
              }
            })
          }
          },
          //新加会员保存数据
          addmember(){
            var _this = this;
            if (_this.phone == '') {
              _this.msgHint('会员姓名不能为空');
              return;
            }
            if (!/^1(3[0-9]|4[57]|5[0-35-9]|7[013678]|8[0-9])[\d]{8}$/g.test(_this.phone)) {
              _this.msgHint('请填写正确手机号码');
              return;
            }
            const data = {
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
                _this.user="";
                _this.phone='';
                _this.address='';
                _this.notes='';
                _this.birthday=_this.initDate();
                _this.sex=1;
                _this.initData();
                _this.close('a');
              } else {
                _this.msgHint(res.msg)
              }
            })
          },
          //删除会员
          delMem(id){
            this.delMemId=id;
           this.popup('dd');
          },
          //二次确认删除会员
          delMemConfirm(){
          	var _this=this;
          	this.ajax(this.port.delete,{vip_id:this.delMemId},'post',function(res){
          		if(res.code==1){
          			_this.initData();
                _this.close('dd');
              }else{
          			_this.msgHint(res.msg);
              }
            })
          },
          //查看会员信息
          getDetail(id){
            this.memPayDetail=[];
            var _this = this;
            var url = this.port.Pay;
            this.ajax(url, {vip_id: id}, "get", function (res) {
              if (res.code == 1) {
                _this.memPayDetail=res.data['list'];
               $('#cc').addClass('in');
              }
            })
          },
          //充值查询详细信息
          payListDetail(id,type){
          	var _this=this;
            this.memPayDetail=[];
          	this.ajax(this.port.print,{print_id:id},'GET',function(res){
          		if(res.code==1){
          			console.log(res);
                _this.memPayDetail=res.data;
                _this.payMoneyData={
                  add_time:res.data['add_time'],
                  pay_no:res.data['paly_on'],
                  totalMoeny:parseInt(res.data['amount'])+parseInt(res.data['zs'])+parseInt(_this.memPayDetail['vip_amount']),
                  //payMoeny:parseInt(res.data['amount'])+parseInt(res.data['zs']),
                  zs:parseInt(res.data['zs']),
                  payMoeny:parseInt(res.data['amount']),
                  pay_type:res.data['paly_type']
                }
             
              }
            })
            if(type=='print'){
          		_this.pr();
            }else{
              $('#ee').addClass('in');
            }
          },
          //切换分页数据
          changePage(page, typedata, type){
            if (type) {
              if (type == 'prev') {
                if (page > 1) {
                  page--;
                  this.page = page;
                } else {
                  return;
                }
              } else {
                if (page < this.mempageInfo['pageCount']) {
                  page++;
                  this.page = page;
                } else {
                  return;
                }
              }
             
            } else {
              if(page==this.page){
                return;
              }
              this.page = page;
            }
            if (typedata == 'index') {
              this.initData();
            } else if (typedata == 'indexSearch') {
              this.indexSearch();
            }else if(typedata=='pay'){
            	this.initPayList();
            }else if(typedata=='paySearch'){
              this.initPaySearchList();
            }
          },
          //时间插件
          selectDate(elem){
            var _this = this;
            laydate({
              elem: elem,
              choose: function (dates) {
                _this.birthday = dates;
              }
            });
          },
          //点击充值
          recharge(id, urlid){
            var id = '#' + id;
            $(id).addClass('in');
            $('.bgblack').addClass('in');
            var _this = this;
            var url = this.port.Pay;
            this.memPayDetail=[];
            this.ajax(url, {vip_id: urlid}, "get", function (res) {
              if (res.code == 1) {
              	_this.memPayDetail=res.data['list'];
              }
            })
          },
          //确认充值
          payConfirm(id){
          	if(!/^(([1-9]{1})(\d){0,20})$/g.test(this.payMoney) || this.payMoney==''){
          		this.msgHint('请输入正确的金额');
          		return;
            }
            if(this.zsMoney){
              if(!/^(([1-9]{1})(\d){0,20})$/g.test(this.zsMoney)){
                this.msgHint('请输入正确的赠送金额');
                return;
              }
            }
          	var _this=this;
          	const  data={
          		vip_id:id,
              amount:this.payMoney,
              zs:this.zsMoney,
              paly_type:this.payType
            }
            this.ajax(this.port.Pay,data,'post',function(res){
            	if(res.code==1){
            		_this.close('b');
                _this.payMoneyData={
                    add_time:res.data['add_time'],
                    pay_no:res.data['paly_on'],
                   totalMoeny:parseInt(res.data['amount'])+parseInt(res.data['zs'])+parseInt(_this.memPayDetail['vip_amount']),
                   payMoeny:parseInt(res.data['amount'])+parseInt(res.data['zs']),
                   pay_type:res.data['paly_type']
                }
                  if(_this.printShow){
                    _this.pr();
                 }
                 console.log(_this.payMoneyData);
                  _this.payMoney='';
                  _this.zsMoney='';
                  _this.initData();
              }else{
            		_this.msgHint(res.msg);
              }
            })
          },
          //打印
          pr(){
          	setTimeout(function(){
              $('#divCustomerRechargePrint').printArea();
             
            },500)
          },
          //充值记录查询列表
          initPayList(){
          	var _this=this;
            this.searchShow=false;
            _this.paegList=[];
            this.payListData=[];
            _this.ajax(_this.port.payList,{page:this.page},'GET',function(res){
              if(res.code==1){
                _this.payListData=res.data['dateList'];
                _this.mempageInfo = res.data.page;
                for (var i = 1; i <= res.data['page']['pageCount']; i++) {
                  _this.paegList.push(i);
                }
              }
            })
          },
          //充值查询搜索
          initPaySearchList(){
            if(this.indexsearchUser=='' &&this.indexsearchPhone==''){
              this.initPayList();
              return;
            }
            var _this = this;
            this.paegList = [];
            this.mempageInfo = [];
            this.payListData=[];
            this.ajax(_this.port.payList, {
              username: this.indexsearchUser,
              phone: this.indexsearchPhone,
              page: this.page
            }, "GET", function (res) {
              if (res.code == 1) {
                _this.payListData=res.data['dateList'];
                _this.mempageInfo = res.data.page;
                for (var i = 1; i <= res.data['page']['pageCount']; i++) {
                  _this.paegList.push(i);
                }
              }
            })
          },
          Search(type){
            this.searchShow=true;
            this.page = 1;
            if (type == 'index') {
              this.indexSearch();
            } else if(type=='pay'){
            	this.initPaySearchList();
            }
          },
          //会员管理搜索
          indexSearch(){
          	if(this.indexsearchUser=='' &&this.indexsearchPhone==''){
          		this.initData();
          		return;
            }
            var _this = this;
            this.paegList = [];
            this.mempageInfo = [];
            this.ajax(_this.port.Search, {
              username: this.indexsearchUser,
              phone: this.indexsearchPhone,
              page: this.page
            }, "GET", function (res) {
              if (res.code == 1) {
                _this.memberList = res.data;
                _this.mempageInfo = res.data.page;
                for (var i = 1; i <= res.data['page']['pageCount']; i++) {
                  _this.paegList.push(i);
                }
              }
            })
          },
          //切换充值类型
          payTypeChange(id){
            this.payType=id;
            $('.money').eq(id-1).addClass('active').siblings('.money').removeClass('active');
          },
          //初始化数据
          initData(){
            var _this = this;
            this.searchShow=false;
            this.paegList = [];
            this.mempageInfo = [];
            this.ajax(_this.port.memberData, {page: this.page}, "get", function (res) {
              if (res.code == 1) {
                _this.memberList = res.data;
                _this.mempageInfo = res.data.page;
                for (var i = 1; i <= res.data['page']['pageCount']; i++) {
                  _this.paegList.push(i);
                }
              }
            })
          }
        },
        mounted(){
          //初始化数据
          this.initData();
       
        },updated(){
       
      }
        
    }
</script>
<style scoped>
     .bench{
       display:none;
       top:50px;
     }
</style>
