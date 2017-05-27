<template>
  <div>
    <div class="contview">
          <!--菜单栏-->
          <div class="contviewtab">
            <a href="javascript:void(0);" :class="{'current' : navid==1}" @click="navclick('')" id="nav" v-if="role.erp_goods_list">库存列表</a>
            <!--<a href="javascript:void(0);" class="" @click="navclick('2')" id="nav2"></a>-->
            <a href="javascript:void(0);" :class="{'current' : navid==2}" @click="navclick('7')" id="nav7" v-if="role.erp_push_log">入库单</a>
            <a href="javascript:void(0);" class="" @click="navclick('3')" id="nav3" v-if="role.erp_push_log">入库明细记录</a>
            <a href="javascript:void(0);" :class="{'current' : navid==3}" @click="navclick('5')" id="nav5" v-if="role.erp_pop_log">出库单</a>
            <a href="javascript:void(0);" class="" @click="navclick('4')" id="nav4" v-if="role.erp_pop_log">出库明细记录</a>
            <a href="javascript:void(0);" :class="{'current' : navid==4}" @click="navclick('6')" id="nav6" v-if="role.erp_pan_dian">盘存记录</a>
            <div class="cvtab_button fr">
              <a class="btngreen r3px smallbtn shopinfobtn fr" href="/b2b/" target="_blank" v-if="btb.length!=0">前往商城</a>
              <a class="btngreen r3px smallbtn chuku fr" href="javascript:void(0)" @click="popup('godown',0,'','get')" v-if="role.erp_pop">新增出库单</a>
              <a class="btngreen r3px smallbtn ruku fr" href="javascript:void(0)" @click="popup('godown',0,'','add')" v-if="role.erp_push">新增入库单</a>
            </div>
          </div>
     <!--库存列表-->
     <div class="warehouse bench white-scroll" id="globaltable" style="display: block;" v-if="role.erp_goods_list">
        <div class="globaltable r5px">
          <div style="padding: 10px 20px;">
                  类目：
                <select class="ng-untouched ng-pristine ng-valid" v-model="goodsSelect" @change="changeSelect">
                  <option value="dosing">
                      原料
                  </option>
                  <option value="goods">
                      商品
                  </option>
                </select>
                <span style="padding-left: 15px;"> 商品名称:</span>
                <input type="text" v-model="goodsKeyword"/>
                <a class="export r3px" @click="initData()">查询</a>
          </div>
         <table border="0" cellpadding="0" cellspacing="0">
           <tbody>
             <tr>
               <td>名称</td>
               <td>类目</td>
               <td>余量</td>
               <td>单位</td>
               <td>操作</td>
               <td>查看流水</td>
             </tr>
             <tr v-for="(goods,index) in dataGoods">
               <td>{{goods.name}}</td>
               <td>{{goods.class}}</td>
               <td>{{goods.stock}}</td>
               <td>{{goods.unit}}</td>
               <td>
                  <a href="javascript:void(0)" @click="popup('put_material',0,goods.id)" v-if="role.erp_push">入库</a>
                  <a href="javascript:void(0)" @click="popup('inventory',0,goods.id)" v-if="role.erp_pan_dian">盘存</a>
                  <a href="javascript:void(0)" @click="popup('scrap',0,goods.id)" v-if="role.erp_pop">出库</a>
               </td>
               <td>
                 <a href="javascript:void(0)" @click=" repertoryDetail('push_material',goods.id,'in',goods.name)" v-if="role.erp_push_log">入库查看</a>
                 <a href="javascript:void(0)" @click=" repertoryDetail('pop_material',goods.id,'out',goods.name)" v-if="role.erp_pop_log">出库查看</a>
                 
               </td>
             <tr>
               <td colspan="9">
                 <div class="page clearfix">
                   <div class="text">共<b>{{dataList.pageNum}}</b>页<b>{{dataList.pageCount}}</b>条记录</div>
                   <div class="linklist">
                     <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
                     <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in goodsPageList"   @click="changePage(pages);" >{{pages==0?'...':pages}}</a>
                     <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
                   </div>
                 </div>
               </td>
           </tr>
           </tbody></table>
       </div>
      </div>
    
     <!--入库明细记录-->
     <div class="warehouse bench white-scroll" id="globaltable3" v-if="role.erp_push_log">
       <div class="jymxtime dwdtl" style="padding:0px;">
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid"  type="text" @click="selectDate('start')" v-model="start_time" >至
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid"  type="text" @click="selectDate('end')" v-model="end_time" >
         <a class="search r3px" @click="inquire()">查询</a>
       </div>
       <div class="globaltable r5px">
         <table border="0" cellpadding="0" cellspacing="0">
           <tbody>
            <tr >
             <td>名称</td>
             <td>数量</td>
             <td>单价</td>
             <td>总价</td>
             <td>备注</td>
             <td>时间</td>
             <td width="10%">操作人</td>
           </tr>
           <tr v-for="(goods,index) in dataGoods">
             <td>{{goods.goods_name}}</td>
             <td>{{goods.num}}</td>
             <td>{{goods.buy_price}}</td>
             <td>{{(goods.num * goods.buy_price).toFixed(2)}}</td>
             <td>{{goods.note}}</td>
             <td>{{goods.add_time}}</td>
             <td width="10%">{{goods.users_name}}</td>
           </tr>
    
           <tr>
             <td colspan="9">
               <div class="page clearfix">
                 <div class="text">共<b>{{dataList.pageNum}}</b>页<b>{{dataList.pageCount}}</b>条记录</div>
                 <div class="linklist">
                   <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
                   <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in goodsPageList"   @click="changePage(pages);" >{{pages==0?'...':pages}}</a>
                   <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
                 </div>
               </div>
             </td>
           </tr>
           </tbody></table>
           <div style="padding-bottom: 10px;" class="clearfix">
              <!--<span class="fl" style="margin: 15px 15px 0 15px;">入库价值总计:</span>-->
              <a class="export r3px fr" style="margin-top: 10px;" @click="exportExe('push')">导出</a>
           </div>
       </div>
     </div>
     <!--出库明细记录-->
     <div class="warehouse bench white-scroll"  id="globaltable4" v-if="role.erp_pop_log">
       <div class="jymxtime dwdtl" style="padding:0px;">
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid"  type="text" @click="selectDate('start')" v-model="start_time">至
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid"  type="text" @click="selectDate('end')" v-model="end_time">
         <a class="search r3px" @click="inquire()">查询</a>
       </div>
       <div class="globaltable r5px">
         <table border="0" cellpadding="0" cellspacing="0">
           <tbody>
            <tr>
             <td>名称</td>
             <td>数量</td>
             <td>单价</td>
             <td>总价</td>
             <td>备注</td>
             <td>时间</td>
             <td width="10%">操作人</td>
           </tr>
           <tr v-for="(goods,index) in dataGoods">
             <td>{{goods.goods_name}}</td>
             <td>{{goods.num}}</td>
             <td>{{goods.buy_price}}</td>
             <td>{{(goods.buy_price * goods.num).toFixed(2)}}</td>
             <td>{{goods.note}}</td>
             <td>{{goods.add_time}}</td>
             <td width="10%">{{goods.users_name}}</td>
           </tr>
    
           <tr>
             <td colspan="9">
               <div class="page clearfix">
                 <div class="text">共<b>{{dataList.pageNum}}</b>页<b>{{dataList.pageCount}}</b>条记录</div>
                 <div class="linklist">
                   <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
                   <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in goodsPageList"   @click="changePage(pages);" >{{pages==0?'...':pages}}</a>
                   <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
                 </div>
               </div>
             </td>
           </tr>
           </tbody></table>
           <div style="padding-bottom: 10px;" class="clearfix">
              <a class="export r3px fr" style="margin-top: 10px;"  @click="exportExe('pop')">导出</a>
           </div>
       </div>
     </div>
    
     <!--盘存记录-->
     <div class="warehouse bench white-scroll" id="globaltable6" v-if="role.erp_pan_dian">
     <div class="jymxtime dwdtl" style="padding:0px;">
       <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid"  type="text" @click="selectDate('start')" v-model="start_time">至
       <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid"  type="text" @click="selectDate('end')" v-model="end_time">
       <a class="search r3px" @click="inquire()">查询</a>
     </div>
     <div class="globaltable r5px">
         <table border="0" cellpadding="0" cellspacing="0">
           <tbody>
            <tr>
             <td>名称</td>
             <td>盘前</td>
             <td>盘后</td>
             <td>时间</td>
             <td>备注</td>
             <td>操作人</td>
           </tr>
           <tr v-for="(goods,index) in dataGoods">
             <td>{{goods.goods_name}}</td>
             <td>{{goods.before}}</td>
             <td>{{goods.after}}</td>
             <td>{{goods.add_time}}</td>
             <td>{{goods.note}}</td>
             <td>{{goods.users_name}}</td>
           </tr>
    
           <tr>
             <td colspan="9">
               <div class="page clearfix">
                 <div class="text">共<b>{{dataList.pageNum}}</b>页<b>{{dataList.pageCount}}</b>条记录</div>
                 <div class="linklist">
                   <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
                   <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in goodsPageList"   @click="changePage(pages);" >{{pages==0?'...':pages}}</a>
                   <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
                 </div>
               </div>
             </td>
           </tr>
           </tbody></table>
       </div>
    </div>
    
    <!--入库单记录-->
     <div class="warehouse bench white-scroll"  id="globaltable7" v-if="role.erp_push_log">
       <div class="jymxtime dwdtl" style="padding:0px;">
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid"  type="text" @click="selectDate('start')" v-model="start_time">至
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid"  type="text" @click="selectDate('end')" v-model="end_time">
         <a class="search r3px" @click="inquire()">查询</a>
       </div>
       
       <div class="globaltable r5px">
         <table border="0" cellpadding="0" cellspacing="0">
           <tbody>
            <tr>
             <td>单号</td>
             <td>时间</td>
             <td>入库备注</td>
             <td>操作</td>
             <td>操作人账号</td>
             
           </tr>
           <tr v-for="(goods,index) in dataGoods">
             <td>{{goods.number}}</td>
             <td>{{goods.add_time}}</td>
             <td>{{goods.note}}</td>
             <td><a href="javascript:void(0)" @click="LookDetail(goods.number)">查看</a></td>
              <td>{{goods.users_name}}</td>
           </tr>
    
           <tr>
             <td colspan="9">
               <div class="page clearfix">
                 <div class="text">共<b>{{dataList.pageNum}}</b>页<b>{{dataList.pageCount}}</b>条记录</div>
                 <div class="linklist">
                   <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
                   <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in goodsPageList"   @click="changePage(pages);" >{{pages==0?'...':pages}}</a>
                   <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
                 </div>
               </div>
             </td>
           </tr>
           </tbody></table>
         
       </div>
     </div>
    
    <!--出库单记录-->
     <div class="warehouse bench white-scroll"  id="globaltable5" v-if="role.erp_pop_log">
       <div class="jymxtime dwdtl" style="padding:0px;">
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid"  type="text" @click="selectDate('start')" v-model="start_time">至
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid"  type="text" @click="selectDate('end')" v-model="end_time">
         <a class="search r3px" @click="inquire()">查询</a>
       </div>
       <div class="globaltable r5px">
         <table border="0" cellpadding="0" cellspacing="0">
           <tbody>
            <tr>
             <td>单号</td>
             <td>时间</td>
             <td>备注</td>
             <td>操作</td>
             <td>操作人账号</td>
           </tr>
           <tr v-for="(goods,index) in dataGoods">
             <td>{{goods.number}}</td>
              <td>{{goods.add_time}}</td>
              <td>{{goods.note}}</td>
              <td><a href="javascript:void(0)" @click="LookDetail(goods.number)">查看</a></td>
             <td>{{goods.users_name}}</td>
           </tr>
    
           <tr>
             <td colspan="9">
              <div class="page clearfix">
                 <div class="text">共<b>{{dataList.pageNum}}</b>页<b>{{dataList.pageCount}}</b>条记录</div>
                 <div class="linklist">
                   <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
                   <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in goodsPageList"   @click="changePage(pages);" >{{pages==0?'...':pages}}</a>
                   <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
                 </div>
               </div>
             </td>
           </tr>
           </tbody></table>
       </div>
     </div>
     
    </div>
    <!--提示框-->
    <!--新增入库单出库单-->
    <div class="viewroom thin-scroll r10px viewspendingroom" id="godown" style="z-index: 9999">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
            <span class="fl">选择商品</span>
            <a class="close fr" href="javascript:void(0);" @click="close('godown')"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail">
          <div class="spending_table flex">
              <div class="g_table flex-1">
                  <div class="tab">
                      <span class="caption current zwx" @click="change_deta('sp')">可选商品</span>
                      <span class="caption zwx" @click="change_deta('yl')">可选原料</span>
                  </div>
                  <div>
                  <!--报错模板-->
                  <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
                  <div class="cont">
                      <table border="0" cellpadding="0" cellspacing="0">
                          <tbody>
                            <tr class="header">
                              <td>分类</td>
                              <td>名称</td>
                              <td v-if="type=='get'">库存</td>
                              <td>操作</td>
                            </tr>
                            <tr class="table_search" v-show = "depositSelect=='goods'">
                              <td >
                                  <select class="ng-untouched ng-pristine ng-valid" v-model="depositAddId" @change="changeDeposit">
                                      <option value="">-请选择分类-</option>
                                      <option v-for="(classify,index) in depositCate"  :value="classify.id">{{classify.cate_name}}</option>
                                  </select>
                              </td>
                              <td style="opacity: 0;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                              <td style="opacity: 0;"><a class="search r3px" href="javascript:void(0)"></a></td>
                              <td v-if="type=='get'"></td>
                            </tr>
                            
                            <tr v-for="(goods,index) in depositGoods">
                                <td>{{goods.class}}</td>
                                <td>{{goods.name}}</td>
                                <td v-if="type=='get'">{{goods.stock}}{{goods.unit}}</td>
                                <td v-if="type=='get'">
                                  <a v-if="goods.stock!=0" class="tianjia" href="javascript:void(0)" @click="addselect(depositSelect,goods.id,goods.sales_price,goods.name,goods.stock)">添加</a>
                                  <a v-if="goods.stock==0" class="tianjia" href="javascript:void(0)">--</a>
                                </td>
                                <td v-if="type=='add'">
                                  <a  class="tianjia" href="javascript:void(0)" @click="addselect(depositSelect,goods.id,goods.sales_price,goods.name,goods.stock)">添加</a>
                                </td>
                            </tr>
                      </tbody>
                      </table>
                  </div>
                 
              <div class="page clearfix">
                 <div class="text">共<b>{{depositList.pageNum}}</b>页<b>{{depositList.pageCount}}</b>条记录</div>
                 <div class="linklist">
                   <a class="prev" href="javascript:void(0)" @click="changePages(depositPage,'prev');">&nbsp;</a>
                   <a href="javascript:void(0)" :class="{'current' : (depositPage==pages)}" v-for="(pages,index) in depositPageList"   @click="changePages(pages);" >{{pages==0?'...':pages}}</a>
                   <a class="next" href="javascript:void(0)" @click="changePages(depositPage,'next');">&nbsp;</a>
                 </div>
              </div>
      
                 </div>
                 
              </div>
              <div class="c_table flex-1">
                  <div class="tab">
                      <span class="caption">已选商品</span>
                  </div>
                  <div class="cont">
                      <table border="0" cellpadding="0" cellspacing="0">
                          <tbody>
                            <tr class="header">
                              <td>名称</td>
                              <td v-if="type=='add'" style="width: 100px;">单价</td>
                              <td>数量</td>
                              <td>操作</td>
                            </tr>
                            <tr v-for='(checkList,index)  in depositCheckList'>
                          <td>{{checkList.name}}</td>
                          <td v-if="type=='add'"><input  type="tel" :value="checkList.buy_price" class="r3px" :id="'inputNum'+checkList.type+checkList.id"  @input="inputNum(checkList.id,checkList.type)" style="text-align: center;border: 1px solid #eee;"/></td>
                          <td class="quantity">
                            <a class="r3px" href="javascript:void(0)"   @click="changeCount(checkList.id,checkList.type,checkList.num,'prve')">-</a>
                            <input type="tel" :value="checkList.num"   :id="'inputCount'+checkList.type+checkList.id"  @input="inputCount(checkList.id,checkList.type)"     class="ng-untouched ng-pristine ng-valid">
                            <a class="r3px" href="javascript:void(0)"  @click="changeCount(checkList.id,checkList.type,checkList.num,'next')">+</a>
                          </td>
                          <td><a href="javascript:void(0);"  @click="delGoods(checkList.id,checkList.type)">移除</a></td>
                        </tr>
                          </tbody>
                      </table>
                      <div class="center fs14 c666" v-if="depositCheckList.length==0">请在左侧选择商品。</div>
                  </div>
              </div>
              </div>
              
           <div class="r5px" style="padding:10px 5px 20px; margin-bottom: 20px; border-bottom:#e8e8e8 1px solid; color:#666;">
              <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td style="width: 74px">备注：</td>
                      <td>
                        <textarea v-model='godownNote'></textarea>
                      </td>
                  </tr>
      
              </tbody></table>
          </div>
          <div class="form_btn clearfix">
              <a class="btngreen fr xinzeng" href="javascript:void(0)" @click="submitDeposit()"><span v-if="type=='add'">入库</span><span v-if="type=='get'">出库</span></a>
          </div>
      </div>
      </div>
    </div>
    <!--end-->
    <!--入库单详情-->
    <div class="viewroom thin-scroll r10px" id="put_deta">
    <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
            <span class="fl">入库单详情</span>
            <a class="close fr" href="javascript:void(0);" @click="close('put_deta')" ></a>
        </div>
        <div class="form_detail">
            <div class="globaltable">
    
                <table border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                      <tr>
                        <td>时间</td>
                        <td>商品名称</td>
                        <td>单价</td>
                        <td>数量</td>
                        <td>备注</td>
                        <td>操作人</td>
                      </tr>
                      <tr v-for="(goods,index) in dataLookGoods">
                        <td>{{goods.add_time}}</td>
                        <td>{{goods.goods_name}}</td>
                        <td>{{goods.buy_price}}</td>
                        <td>{{goods.num}}</td>
                        <td>{{goods.note}}</td>
                        <td>{{goods.users_name}}</td>
                      </tr>
                      
                    <tr>
                        <td colspan="9">
                           <div class="page clearfix">
                             <div class="text">共<b>{{lookList.pageNum}}</b>页<b>{{lookList.pageCount}}</b>条记录</div>
                             <div class="linklist">
                               <a class="prev" href="javascript:void(0)" @click="changePagess(lookPage,'prev');">&nbsp;</a>
                               <a href="javascript:void(0)" :class="{'current' : (lookPage==pages)}" v-for="(pages,index) in lookPageList"   @click="changePagess(pages);" >{{pages==0?'...':pages}}</a>
                               <a class="next" href="javascript:void(0)" @click="changePagess(lookPage,'next');">&nbsp;</a>
                             </div>
                          </div>
                        </td>
                    </tr>
                </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
    <!--end-->
    <!--出库单详情-->
    <div class="viewroom thin-scroll r10px" id="come_deta">
    <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
            <span class="fl">出库单详情</span>
            <a class="close fr" href="javascript:void(0);" @click="close('come_deta')" ></a>
        </div>
        <div class="form_detail">
            <div class="globaltable">
    
                <table border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                      <tr>
                        <td>时间</td>
                        <td>商品名称</td>
                        <td>单价</td>
                        <td>数量</td>
                        <td>备注</td>
                        <td>操作人</td>
                      </tr>
                      <tr v-for="(goods,index) in dataLookGoods">
                        <td>{{goods.add_time}}</td>
                        <td>{{goods.goods_name}}</td>
                        <td>{{goods.buy_price}}</td>
                        <td>{{goods.num}}</td>
                        <td>{{goods.note}}</td>
                        <td>{{goods.users_name}}</td>
                      </tr>
                      <tr>
                        <td colspan="9">
                           <div class="page clearfix">
                             <div class="text">共<b>{{lookList.pageNum}}</b>页<b>{{lookList.pageCount}}</b>条记录</div>
                             <div class="linklist">
                               <a class="prev" href="javascript:void(0)" @click="changePagess(lookPage,'prev');">&nbsp;</a>
                               <a href="javascript:void(0)" :class="{'current' : (lookPage==pages)}" v-for="(pages,index) in lookPageList"   @click="changePagess(pages);" >{{pages==0?'...':pages}}</a>
                               <a class="next" href="javascript:void(0)" @click="changePagess(lookPage,'next');">&nbsp;</a>
                             </div>
                          </div>
                        </td>
                    </tr>
                </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
    <!--end-->
    <!--商品入库-->
    <div class="viewsmall form_cont r10px   adddeskclassify" id="put_material">
    <div class="form_cap clearfix">
      <span class="fl">货品入库</span>
      <a class="close fr" @click="close('put_material')" href="javascript:void(0);"></a>
    </div>
    <div class="form_detail">
    
      <div class="form_table">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td>单价：</td>
              <td>
                <input name="classifyname"  type="text" class="ng-untouched ng-pristine ng-valid"  v-model="depositPrice"  placeholder="输入单价"/>
                <span>元</span>
              </td>
            </tr>
            <tr>
              <td>数量：</td>
              <td>
                <input name="classifyname"  type="text" class="ng-untouched ng-pristine ng-valid" v-model="depositNum"   placeholder="输入数量"/>
              </td>
            </tr>
           <tr>
              <td>总价：</td>
              <td>
                {{depositPrice * depositNum}}元
              </td>
           </tr>
           <tr>
              <td>备注：</td>
              <td>
                <input name="classifyname"  type="text" class="ng-untouched ng-pristine ng-valid" v-model="depositNote"   placeholder="输入备注"/>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
       <!--报错模板-->
       <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_btn">
        
        <a class="btngreen baocun" href="javascript:void(0);"  @click="deposit('{{}}')" >确定</a>
      </div>
    </div>
    </div>
    <!--/end-->
    <!--盘存-->
    <div class="viewsmall form_cont r10px   adddeskclassify" id="inventory">
    <div class="form_cap clearfix">
      <span class="fl">盘存</span>
      <a class="close fr" @click="close('inventory')" href="javascript:void(0);"></a>
    </div>
    <div class="form_detail">
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_table">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td>输入实核数量：</td>
              <td>
                <input name="classifyname" v-model='getOutNum' type="text" class="ng-untouched ng-pristine ng-valid"   placeholder="输入实核数量"/>
              </td>
            </tr>
           <tr>
              <td>备注：</td>
              <td>
                <input name="classifyname"  type="text" class="ng-untouched ng-pristine ng-valid" v-model='getOutNote'   placeholder="输入备注"/>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form_btn">
        <a class="btngreen baocun" href="javascript:void(0);"   @click="getOut('inventory')" >确定</a>
      </div>
    </div>
    </div>
    <!--/end-->
    <!--出库商品-->
    <div class="viewsmall form_cont r10px   adddeskclassify" id="scrap">
	    <div class="form_cap clearfix">
	      <span class="fl">出库</span>
	      <a class="close fr" @click="close('scrap')" href="javascript:void(0);"></a>
	    </div>
	     <!--报错模板-->
	    <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
	    <div class="form_detail">
	    
	      <div class="form_table">
	        <table border="0" cellpadding="0" cellspacing="0">
	          <tbody>
	            <tr>
	              <td>出库数量：</td>
	              <td>
	                <input name="classifyname"  type="text" class="ng-untouched ng-pristine ng-valid" v-model='getOutNum'  placeholder="输入出库数量"/>
	              </td>
	            </tr>
	            <tr>
	              <td>备注：</td>
	              <td>
	                <input name="classifyname" v-model='getOutNote'  type="text" class="ng-untouched ng-pristine ng-valid"   placeholder="输入备注"/>
	              </td>
	            </tr>
	          </tbody>
	        </table>
	      </div>
	      <div class="form_btn">
	        <a class="btngreen baocun" href="javascript:void(0);"  @click="getOut('get')" >确定</a>
	      </div>
	    </div>
    </div>
    <!--/end-->
    <!--查看入库详情-->
    <div class="drawerdetail flex flex-v" id="push_material">
    <div class="dwdtl-scroll white-scroll flex-1">
      <div class="dwdtl_name clearfix">
        <span class="fl">【{{goodsName}}】{{goodsreType}}记录查询</span>
        <a class="close fr" href="javascript:void(0);" @click="close('push_material')" ></a>
      </div>
      <div class="jymxtime dwdtl">
        <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" type="text" @click="selectDate('start')" v-model="start_time">至
        <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" type="text" @click="selectDate('end')" v-model="end_time">
        <a class="search r3px" @click="changeTime();">查询</a>
      </div>
      <div class="theinfo_tbl">
        <div class="globaltable r5px">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>名称</td>
              <td>类型</td>
              <td>时间</td>
              <td>单价</td>
              <td>数量</td>
              <td>总额</td>
            </tr>
            <tr v-for="(goods,index) in dataLookGoods">
              <td>{{goods.goods_name}}</td>
              <td>{{goods.status}}</td>
              <td>{{goods.add_time}}</td>
              <td>{{goods.buy_price}}</td>
              <td>{{goods.num}}</td>
              <td>{{(goods.num*Number(goods.buy_price)).toFixed(2)}}</td>
            </tr>
            <tr>
              <td colspan="9">
                <div class="page clearfix">
                  <div class="text">共<b>{{lookList.pageNum}}</b>页<b>{{lookList.pageCount}}</b>条记录</div>
                  <div class="linklist">
                    <a class="prev" href="javascript:void(0)" @click="changePagesss(lookPage,'prev');">&nbsp;</a>
                    <a href="javascript:void(0)" :class="{'current' : (lookPage==pages)}" v-for="(pages,index) in lookPageList"   @click="changePagesss(pages);" >{{pages==0?'...':pages}}</a>
                    <a class="next" href="javascript:void(0)" @click="changePagesss(lookPage,'next');">&nbsp;</a>
                  </div>
                </div>
              </td>
            </tr>
            </tbody></table>
        </div>
      </div>
    </div>
    
    </div>
    <!--查看出库详情-->
    <div class="drawerdetail flex flex-v" id="pop_material">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">【{{goodsName}}】{{goodsreType}}记录查询</span>
          <a class="close fr" href="javascript:void(0);" @click="close('pop_material')" ></a>
        </div>
        <div class="jymxtime dwdtl">
          <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" type="text" @click="selectDate('start')" v-model="start_time">至
          <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" type="text" @click="selectDate('end')" v-model="end_time">
          <a class="search r3px"  @click="changeTime();">查询</a>
        </div>
        <div class="theinfo_tbl">
          <div class="globaltable r5px">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody>
              <tr>
                <td>名称</td>
                <td>类型</td>
                <td>时间</td>
                <td>数量</td>
              </tr>
              <tr v-for="(goods,index) in dataLookGoods">
                <td>{{goods.goods_name}}</td>
                <td>{{goods.status}}</td>
                <td>{{goods.add_time}}</td>
                <td>{{goods.num}}</td>
               
              </tr>
              <tr>
                <td colspan="9">
                  <div class="page clearfix">
                    <div class="text">共<b>{{lookList.pageNum}}</b>页<b>{{lookList.pageCount}}</b>条记录</div>
                    <div class="linklist">
                      <a class="prev" href="javascript:void(0)" @click="changePagesss(lookPage,'prev');">&nbsp;</a>
                      <a href="javascript:void(0)" :class="{'current' : (lookPage==pages)}" v-for="(pages,index) in lookPageList"   @click="changePagesss(pages);" >{{pages==0?'...':pages}}</a>
                      <a class="next" href="javascript:void(0)" @click="changePagesss(lookPage,'next');">&nbsp;</a>
                    </div>
                  </div>
                </td>
              </tr>
              </tbody></table>
          </div>
        </div>
      </div>
  
    </div>
    <!--end-->
    <!--遮罩层-->
    <div class="bgblack "></div>
    <!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
  </div>
</template>
<script>
  import {mapGetters,mapActions} from  'vuex';
  export default{
  	data(){
  		return{
  			iSsuccess:false,
        	isLoading: false,
        	msgShow: false,
        	msg: '',
  				start_time:'2017-01-01',//开始时间
  				end_time:'2018-01-01',//结束时间
	     		goodsSelect:'dosing',//类目选择
	        page:1,//库存列表分页
	        goodsKeyword:'',//库存搜索
	        dataList:[],//库存数据
	        dataGoods:[],//库存详细数据
	        goodsPageList:[],//分页总数
	        depositId:'',//入库id
	        depositNum:'',//入库数量
	        depositPrice:'',//入库单价
	        depositNote:'',//入库备注
	        navId:'',//nav显示id
	        depositSelect:'goods',//入库商品
	        depositAddId:'',//入库分类id
	        depositPageList:[],//入库分页总数
	        depositPage:1,//入库分页数
	        depositList:[],//入库商品数据
	        depositGoods:[],//入库商品详细数据
	        depositCate:[],//入库商品分类
	        depositCheckList:[],//入库选中商品数据
	        godownNote:'',//入库单备注
	        getOutNum:'',//出库数量
	        getOutNote:'',//出库备注
	        type:'',//入库出库状态判断
	        dataLookGoods:[],//查看出库记录和入库记录数据
	        lookPage:1,//查看出库记录和入库记录数据分页
	        lookPageList:[],//查看出库记录和入库记录数据分页总数
	        lookList:[],//查看出库记录和入库记录总数据
	        lookNum:'',//查看单号
          goodsName:'',
          goodsreType:'',
          goodsreId:'',
          jcList:this.getRole,
          role:[],//权限
          navid:'',//nav切换id
          btb:[]
  		}
  	},
    computed:mapGetters(['getInit']),
    methods: {
//            弹出框显示隐藏
      popup (id,open,depositId,type){
        var id = '#'+id;
        if(depositId){
        	this.depositId=depositId;
        }
        if(type){
        	this.type = type;
        }
        $(id).addClass('in');
        var open =open;
        if(open!=1){
          $('.bgblack').addClass('in');
        }
      },
      //导出excel
      exportExe(type){
      	var _this=this;
      	window.location.href=_this.hostUrl+_this.port.export+"?start_time="+_this.start_time+"&end_time="+_this.end_time+"&type="+type;
      },
      close(id){
      	var _this = this;
        var id = '#'+id;
        var open =open;
        _this.depositNum='';
	 		  _this.depositPrice='';
	 		  _this.depositNote='';
        _this.lookPage=1;
	 		  _this.getOutNum='';//出库数量
	      _this.getOutNote='';//出库备注
	 		  _this.depositCheckList=[];
        $(id).removeClass('in');
        $('.bgblack').removeClass('in');
      },
//          导航切换
      navclick(id){
      	var _this = this;
        var id = id;
        _this.navId = id;
        _this.page = 1;
        if(_this.navId != ""){
        	_this.depositDetail();
        }
        if(_this.navId == ''){
        	this.initData();
        }
        var bleid =  '#globaltable' + id;
        var nav = '#nav' + id;
        _this.getDate();
        $('.bench').hide();
        $('.contviewtab a').siblings('.current').removeClass('current').end().removeClass('current');
        $(bleid).show();
        $(nav).addClass('current');
      },
      //时间插件
		  //入库单时间插件
		  selectDate(type){
		    var _this = this;
		    laydate({
		      choose: function (dates)
          {
		      	if(type=='start'
            ){
		      		_this.start_time = dates;
		      	}else{
		      		_this.end_time = dates;
		      	}
		      },
		      isclear:false
		    });
		  },
		   //获取当前时间
      getDate(){
        var startTime='';
        var endTime='';
        var myDate = new Date();
        var Y = myDate.getFullYear();
        var M = myDate.getMonth() + 1;
        startTime+=Y+'-';
        endTime+=Y+'-';
        if(M < 10){
          startTime+='0'+M+'-';
          endTime+='0'+M+'-';
        }else{
          startTime+=M+'-';
          endTime+=M+'-';
        }
        startTime+='01';
        endTime+= this.getDates();
        this.start_time=startTime;
        this.end_time=endTime;
      },
      //一个月有多少天
			getDates(){
			    var curDate = new Date();
			    /* 获取当前月份 */
			    var curMonth = curDate.getMonth();
			    /*  设置当前月份的后一个月 */
			    curDate.setMonth(curMonth + 1);
			    /* 设置当前日期，如果参数为0，则返回上月最后一日的日期 */
			    curDate.setDate(0);
			    /* 返回当月的天数 */
			    return curDate.getDate();
			},
	   //分页
//    goodsPageListgoodsPageList(page, type){
//      if (type) {
//        if (type == 'prev') {
//          if (page > 1) {
//            page--;
//            this.page = page;
//            if(this.navId == ''){
//            	this.initData();
//            };
//            if(this.navId != ""){
//            	this.depositDetail();
//            }
//          }
//        } else {
//          if (page < this.dataList.pageNum){
//            page++;
//            this.page = page;
//
//            if(this.navId == ''){
//            	this.initData();
//            };
//            if(this.navId != ""){
//            	this.depositDetail();
//            }
//          }
//        }
//
//      } else {
//        this.page = page;
//        if(this.navId == ''){
//        	this.initData();
//        };
//        if(this.navId != ""){
//        	this.depositDetail();
//        }
//      }
//    },
			//分页
      changePage(page,type){
        if(Number(page)){
        	var _this=this;
          if(type) {
            if (type == 'prev') {
              if (page > 1) {
                page--;
                _this.page = page;
                _this.getpage(page);
                if(this.navId == ''){
			          	this.initData();
			          };
			          if(this.navId != ""){
			          	this.depositDetail();
			          }
              } else {
                return;
              }
            } else {
              if (page < _this.dataList.pageNum) {
                page++;
                _this.page = page;
                _this.getpage(page);
                if(this.navId == ''){
			          	this.initData();
			          };
			          if(this.navId != ""){
			          	this.depositDetail();
			          }
              } else {
                return;
              }
            }
          }else{
            _this.page=page;
            _this.getpage(page);
            if(this.navId == ''){
	          	this.initData();
	          };
	          if(this.navId != ""){
	          	this.depositDetail();
	          }
          }
        }
      },
      getpage(page){
        var _this=this;
        if(_this.dataList.pageNum>10){
          //当前页小于6
          if(page<6){
            _this.goodsPageList=[];
            for(let i=1;i<=7;i++){
              if(i==7){
                _this.goodsPageList.push(0);
              }else{
                _this.goodsPageList.push(i);
              }
            }
            _this.goodsPageList.push(_this.dataList.pageNum);
            _this.page=page;
          }
          //当前页中间部分
          if(page>5 && page<_this.dataList.pageNum-2){
            _this.goodsPageList=[];
            _this.goodsPageList.push(1,0);
            for(let i=page-2;i<=page+2;i++){
              _this.goodsPageList.push(i);
            }
            _this.goodsPageList.push(0,_this.dataList.pageNum);
            _this.page=page;
          }
          //最后几页
          if(_this.dataList.pageNum-2<=page && page<=_this.dataList.pageNum){
            _this.goodsPageList=[];
            _this.goodsPageList.push(1,0);
            for(let i=_this.dataList.pageNum-6;i<=_this.dataList.pageNum;i++){
              _this.goodsPageList.push(i);
            }
            _this.page=page;
          }
        }else{
          _this.page=page;
          _this.goodsPageList=[];
          for(let i=1;i<=_this.dataList.pageNum;i++){
            _this.goodsPageList.push(i);
          }
        }
      },
      //初始化库存列表数据
      initData(){
        var _this = this;
        this.ajax(this.port.goodsList, {select: _this.goodsSelect,keyword:_this.goodsKeyword,page:_this.page}, "GET", function (res) {
        	 if (res.code == 1) {
        	 	_this.dataList =[];
        	 	_this.dataList = res.data;
		        _this.dataGoods = _this.dataList.list;
		        _this.getpage(_this.page);
        	 }else {
	            _this.msgHint(res.msg);
	         }
        })
      },
      //切换类目
      changeSelect(){
      	var _this =this;
        if(_this.goodsSelect=='goods'){
        	_this.goodsSelect = 'goods';
        	_this.page = '1';
        }else{
        	_this.goodsSelect = 'dosing';
        	_this.page = '1';
        }
        this.initData();
      },
      //库存列表入库
      deposit(){
      	 var _this = this;
      	if (!/^(([1-9]{1}\d{0,9}\.\d{1,2})|([1-9]{1}\d{0,9}|([0]{1}\.\d{1,2})))$/.test(_this.depositPrice)) {
          _this.msgHint('请输入正确的价格');
          return;
        }
      	 if (_this.depositNum == '' ||  !/^\+?[1-9][0-9]*$/.test(_this.depositNum)) {
          _this.msgHint('数量必须是正整数');
          return;
        }
      	 if (_this.depositNote == '') {
          _this.msgHint('请填写入库备注');
          return;
        }
         this.ajax(this.port.deposit, {id: _this.depositId,num:_this.depositNum,buy_price:_this.depositPrice,note:_this.depositNote,type:_this.goodsSelect}, "POST", function (res) {
        	 if (res.code == 1) {
        	 	_this.initData();
        	 	_this.close('put_material');
        	 }else {
	            _this.msgHint(res.msg);
	         }
         })
      },
      //库存列表出库与盘存
      getOut(type){
      	 var _this = this;
      	 var getUrl='';
      	 var state = type;
      	 if(state=='get'){
      	 	 getUrl = this.port.getOut;
      	 }else{
      	 	 getUrl = this.port.inventory;
      	 }
      	 if (_this.getOutNum == '' ||  !/^\+?[1-9][0-9]*$/.test(_this.getOutNum)) {
          _this.msgHint('数量必须是正整数');
          return;
        }
      	 if (_this.getOutNote == '') {
          _this.msgHint('请填写入库备注');
          return;
        }
         this.ajax(getUrl,{id:_this.depositId,num:_this.getOutNum,note:_this.getOutNote,type:_this.goodsSelect}, "POST", function (res) {
        	 if (res.code == 1) {
        	 	_this.initData();
        	 	_this.getOutNum='';//出库数量
	      		_this.getOutNote='';//出库备注
        	 	if(state != 'inventory'){
        	 		_this.close('scrap');
        	 	}else{
        	 		_this.close('inventory');
        	 	}
        	 }else {
	            _this.msgHint(res.msg);
	         }
         })
      },
	  //入库明细记录，入库单数据，出库明细，出库单
	    depositDetail(){
	  	var _this = this;
	  	var depositUrl = '';
	  	if(_this.navId==3){
	  		depositUrl = _this.port.depositdeta;
	  	}
	  	if(_this.navId==7){
	  		depositUrl = _this.port.godown;
	  	}
	  	if(_this.navId==4){
	  		depositUrl = _this.port.getOutDeta;
	  	}
	  	if(_this.navId==5){
	  		depositUrl = _this.port.getMulti;
	  	}
	  	if(_this.navId==6){
	  		depositUrl = _this.port.inventoryDeta;
	  	}
        this.ajax(depositUrl,{start_time: _this.start_time,end_time:_this.end_time,page:_this.page},"GET", function (res) {
        	 if (res.code == 1) {
        	 	_this.dataList =[];
        	 	_this.dataList = res.data;
		        _this.dataGoods = _this.dataList.list;
		        _this.getpage(_this.page);
        	 }else {
	            _this.msgHint(res.msg);
	         }
        })
	  },
	  //初始化库存列表数据
      addDeposit(){
        var _this = this;
        this.ajax(this.port.depositInit, {select: _this.depositSelect,cate_id:_this.depositAddId,page:_this.depositPage}, "GET", function (res) {
        	 if (res.code == 1) {
        	 	_this.depositList =[];
        	 	_this.depositList = res.data;
		        _this.depositGoods = res.data.list;
		        _this.depositCate = res.data.cate;
		        _this.depositPageList=[];
		        _this.getpages(_this.depositPage);
        	 }else {
	            _this.msgHint(res.msg);
	         }
        })
      },
       //入库分页
//    changePages(page, type){
//      if (type) {
//        if (type == 'prev') {
//          if (page > 1) {
//            page--;
//            this.depositPage = page;
//            this.addDeposit();
//          }
//        } else {
//          if (page < this.depositList.pageCount){
//            page++;
//            this.depositPage = page;
//            this.addDeposit();
//          }
//        }
//
//      } else {
//        this.depositPage = page;
//        this.addDeposit();
//      }
//    },
      changePages(page,type){
        if(Number(page)){
        	var _this=this;
          if(type) {
            if (type == 'prev') {
              if (page > 1) {
                page--;
                _this.depositPage = page;
                _this.getpages(page);
                _this.addDeposit();
              } else {
                return;
              }
            } else {
              if (page < _this.depositList.pageNum) {
                page++;
                _this.depositPage = page;
                _this.getpages(page);
                _this.addDeposit();
              } else {
                return;
              }
            }
          }else{
            _this.depositPage=page;
            _this.getpages(page);
            _this.addDeposit();
          }
        }
      },
      getpages(page){
        var _this=this;
        if(_this.depositList.pageNum>10){
          //当前页小于6
          if(page<6){
            _this.depositPageList=[];
            for(let i=1;i<=7;i++){
              if(i==7){
                _this.depositPageList.push(0);
              }else{
                _this.depositPageList.push(i);
              }
            }
            _this.depositPageList.push(_this.depositList.pageNum);
            _this.depositPage=page;
          }
          //当前页中间部分
          if(page>5 && page<_this.depositList.pageNum-2){
            _this.depositPageList=[];
            _this.depositPageList.push(1,0);
            for(let i=page-2;i<=page+2;i++){
              _this.depositPageList.push(i);
            }
            _this.depositPageList.push(0,_this.depositList.pageNum);
            _this.depositPage=page;
          }
          //最后几页
          if(_this.depositList.pageNum-2<=page && page<=_this.depositList.pageNum){
            _this.depositPageList=[];
            _this.depositPageList.push(1,0);
            for(let i=_this.depositList.pageNum-6;i<=_this.depositList.pageNum;i++){
              _this.depositPageList.push(i);
            }
            _this.depositPage=page;
          }
        }else{
          _this.depositPage=page;
          _this.depositPageList=[];
          for(let i=1;i<=_this.depositList.pageNum;i++){
            _this.depositPageList.push(i);
          }
        }
      },
      //切换入库商品分类
      changeDeposit(){
      	var _this =this;
        _this.depositSelect='goods';
        _this.depositPage=1;
        this.addDeposit();
      },
      //切换入库分类
      change_deta(type){
      	var _this=this;
      	_this.depositPage=1;
      	if(type == 'sp'){
      		$('.zwx').eq(0).addClass('current').siblings('.zwx').removeClass('current');
      		_this.depositSelect='goods';
      	}else{
      		$('.zwx').eq(1).addClass('current').siblings('.zwx').removeClass('current');
      		_this.depositSelect='dosing';
      	}
      	_this.addDeposit();
      },
      //更改时间查询出入库数据
      changeTime(){
      	var _this=this;
        if(_this.goodsreType=="入库"){
          _this.repertoryDetail('push_material',_this.goodsreId,'in',_this.goodsName);
        }else{
          _this.repertoryDetail('ppo_material',_this.goodsreId,'out',_this.goodsName);
        }
      },
      //出入库流水查询
      repertoryDetail(ele,id,type,name){
        var _this=this;
        var url,data;
        _this.goodsName =name;
        _this.goodsreId =id;
      	if( type=='in'){
          _this.goodsreType='入库';
          url=_this.port.depositdeta;
        }else{
          _this.goodsreType='出库';
          url=_this.port.getOutDeta;
         
        }
        data={
          start_time:_this.start_time,
          end_time:_this.end_time,
          id:_this.goodsreId,
          page:_this.lookPage,
          type:_this.goodsSelect
        }
        _this.ajax(url,data,'get',function (res) {
          if(res.code==1){
            _this.dataLookGoods =[];
            _this.lookList =[];
            _this.dataLookGoods = res.data.list;
            _this.lookList= res.data;
            _this.getpagess(_this.lookPage);
            _this.popup(ele,1);
          }
        })
      },
      //添加选中数据
      addselect(type,id,price,name,stock){
      	var _this=this;
      	var obj ={
      		name:name,
      		type:type,
      		buy_price:price,
      		id:id,
      		num:1,
      		stock:stock
      	}
      	if(_this.depositCheckList.length==0){
      		_this.depositCheckList.push(obj);
      	}
      	
      	if (_this.getIsepetition(id,type)) {
              _this.depositCheckList.push(obj);
       }
      },
      //判断列表中是否有重复数据
	    getIsepetition(id,type){
	      var arr = [];
	      var result = false;
	      for (var j = 0; j < this.depositCheckList.length; j++) {
	        if (this.depositCheckList[j]['id'] == id && this.depositCheckList[j]['type'] == type) {
	          arr.push(0);
	        } else {
	          arr.push(1);
	        }
	      }
	      if (arr.indexOf(0) != -1) {
	        result = false;
	      } else {
	        result = true;
	      }
	      return result;
	    },
	   //修改价格
     inputNum(id,type){
     	var price = Number($('#inputNum'+type+id).val());
     	
     	for (var j = 0; j < this.depositCheckList.length; j++) {
	        if (this.depositCheckList[j]['id'] == id && this.depositCheckList[j]['type'] == type) {
	         this.depositCheckList[j]['buy_price']=price;
	        }
	      }
     	
     },
     //加减数量
     changeCount(id,type,count,name){
     	var count=count;
     	var index = '';
	 		for (var j = 0; j < this.depositCheckList.length; j++) {
	        if (this.depositCheckList[j]['id'] == id && this.depositCheckList[j]['type'] == type) {
	         index = j;
	        }
	    }
     	if(name=='prve'){
     		if(count>1){
     			count--;
     		}else{
     			return;
     		}
     	}
     	if(name=='next'){
     		if(this.type=='get'){
     			if(count < this.depositCheckList[index]['stock']){
     				count++;
     			}
     			if(count == this.depositCheckList[index]['stock']){
     				this.msgHint('不能超出最大库存');
     			}
     		}else{
     			count++;
     		}
     	}
	     this.depositCheckList[index]['num']=count;
	      	
     },
     //移出
     delGoods(id,type){
     	this.depositCheckList.splice(this.getIndex(id,type),1);
     },
     //获取index索引
     getIndex(id,type){
     	var result;
     	for (var j = 0; j < this.depositCheckList.length; j++) {
	        if (this.depositCheckList[j]['id'] == id && this.depositCheckList[j]['type'] == type) {
	         result=j;
	        }
	     }
     	return result;
     },
     //出库数量修改
     inputCount(id,type){
     	var Count = Number($('#inputCount'+type+id).val());
     	var index = '';
	 		for (var j = 0; j < this.depositCheckList.length; j++) {
	        if (this.depositCheckList[j]['id'] == id && this.depositCheckList[j]['type'] == type) {
	         index = j;
	        }
	    }
     	var getNum = this.depositCheckList[index]['stock'];
	     if(this.type == 'get'){
	     	  if(Count > getNum){
	     	  	$('#inputCount'+type+id).val(getNum);
	     	  	this.depositCheckList[index]['num']=getNum;
	     	  	this.msgHint('不能超出最大库存');
	     	  }else{
	     	  	this.depositCheckList[index]['num']=Count;
	     	  }
	     }else{
	     			this.depositCheckList[index]['num']=Count;
	     }
     },
     //提交入库单
     submitDeposit(){
			    var _this = this;
			    var submitUrl='';
			    if(_this.type == 'get'){
			    	submitUrl=this.port.getOutMulti;
			    }else{
			    	submitUrl=this.port.addDeposit;
			    }
			    if(_this.depositCheckList.length==0){
			    	_this.msgHint('请选择商品');
			    	return;
			    }
	        this.ajax(submitUrl,{list: _this.depositCheckList,note:_this.godownNote},"POST", function (res) {
	        	 if (res.code == 1) {
	        	    _this.close('godown');
	        	    _this.depositCheckList=[];
	        	 }else {
		            _this.msgHint(res.msg);
		         }
	        })
     },
	   //按时间查询
	   inquire(){
	   	 this.depositDetail();
	   },
	   //入库出库查看
	   LookDetail(num){
	  	var _this = this;
	  	var detaLookUrl = '';
	  	if(num){
	  		_this.lookNum = num;
	  	}
	  	
	  	if(_this.navId==7){
	  		detaLookUrl = _this.port.depositdeta;
	  		_this.popup('put_deta');
	  	}
	  	if(_this.navId==5){
	  		_this.popup('come_deta');
	  		detaLookUrl = _this.port.getOutDeta;
	  	}
        this.ajax(detaLookUrl,{storage_number:_this.lookNum,page:_this.lookPage},"GET", function (res) {
        	 if (res.code == 1) {
             _this.dataLookGoods =[];
        	 	_this.lookList =[];
		        _this.dataLookGoods = res.data.list;
		        _this.lookList= res.data;
		        _this.getpagess(_this.lookPage);
        	 }else {
	            _this.msgHint(res.msg);
	         }
        })
	  },
	  //查看入库出库详情分页
	  changePagess(page,type){
        if(Number(page)){
        	var _this=this;
          if(type) {
            if (type == 'prev') {
              if (page > 1) {
                page--;
                _this.lookPage = page;
                _this.getpagess(page);
                _this.LookDetail();
              } else {
                return;
              }
            } else {
              if (page < _this.lookList.pageNum) {
                page++;
                _this.lookPage = page;
                _this.getpagess(page);
                _this.LookDetail();
              } else {
                return;
              }
            }
          }else{
            _this.lookPage=page;
            _this.getpagess(page);
            _this.LookDetail();
          }
        }
      },
	  changePagesss(page,type){
        if(Number(page)){
        	var _this=this;
          if(type) {
            if (type == 'prev') {
              if (page > 1) {
                page--;
                _this.lookPage = page;
                _this.getpagess(page);
                if(_this.goodsreType=="入库"){
                  _this.repertoryDetail('push_material',_this.goodsreId,'in',_this.goodsName);
                }else{
                  _this.repertoryDetail('ppo_material',_this.goodsreId,'out',_this.goodsName);
                }
                
              } else {
                return;
              }
            } else {
              if (page < _this.lookList.pageNum) {
                page++;
                _this.lookPage = page;
                _this.getpagess(page);
                if(_this.goodsreType=="入库"){
                  _this.repertoryDetail('push_material',_this.goodsreId,'in',_this.goodsName);
                }else{
                  _this.repertoryDetail('ppo_material',_this.goodsreId,'out',_this.goodsName);
                }
              } else {
                return;
              }
            }
          }else{
            _this.lookPage=page;
            _this.getpagess(page);
            if(_this.goodsreType=="入库"){
              _this.repertoryDetail('push_material',_this.goodsreId,'in',_this.goodsName);
            }else{
              _this.repertoryDetail('ppo_material',_this.goodsreId,'out',_this.goodsName);
            }
          }
        }
      },
      getpagess(page){
        var _this=this;
        if(_this.lookList.pageNum>10){
          //当前页小于6
          if(page<6){
            _this.lookPageList=[];
            for(let i=1;i<=7;i++){
              if(i==7){
                _this.lookPageList.push(0);
              }else{
                _this.lookPageList.push(i);
              }
            }
            _this.lookPageList.push(_this.lookList.pageNum);
            _this.lookPage=page;
          }
          //当前页中间部分
          if(page>5 && page<_this.lookList.pageNum-2){
            _this.lookPageList=[];
            _this.lookPageList.push(1,0);
            for(let i=page-2;i<=page+2;i++){
              _this.lookPageList.push(i);
            }
            _this.lookPageList.push(0,_this.lookList.pageNum);
            _this.lookPage=page;
          }
          //最后几页
          if(_this.lookList.pageNum-2<=page && page<=_this.lookList.pageNum){
            _this.lookPageList=[];
            _this.lookPageList.push(1,0);
            for(let i=_this.lookList.pageNum-6;i<=_this.lookList.pageNum;i++){
              _this.lookPageList.push(i);
            }
            _this.lookPage=page;
          }
        }else{
          _this.lookPage=page;
          _this.lookPageList=[];
          for(let i=1;i<=_this.lookList.pageNum;i++){
            _this.lookPageList.push(i);
          }
        }
      },
      
	},
	    mounted(){
	    	//初始化数据
        var str = window.location.href;
        if(str.indexOf('content/repertory')!=-1){
          $('#navstr').html('库存');
        }
	      var _this = this;
	      this.initData();
	      this.addDeposit();
	      this.getDate();
	      $('.money').click(function(){
	        $(this).addClass('active').siblings('.money').removeClass('active');
	      })
        _this.role = _this.getInit['roleData']['repertory'];
        _this.btb=_this.getInit['roleData']['b2b'];
        //判断权限后给第一个nav动态绑定class
        if(_this.role.erp_goods_list){
        	_this.navid=1;
        	return;
        }else if(_this.role.erp_push_log){
        	_this.navid=2;
          return;
        }else if(_this.role.erp_pop_log){
        	_this.navid=3;
          return;
        }else if(_this.role.erp_pan_dian){
        	_this.navid=4;
          return;
        }
	    },
  }
</script>

  <style scoped>
    .bench{
      display:none;
      top:50px;
    }
    .text-center{
    	text-align: center !important;
    }
</style>
