<template>
  <div>
    <!--业务导航切换-->
    <div class="contviewtab" v-if="role.business_desktopstatus" >
      <a href="javascript:void(0);"    class="chageclass  current">全部({{dataList.he}})</a>
      <a href="javascript:void(0);"  class="chageclass">散座({{dataList.sanzuoNum}})</a>
      <a href="javascript:void(0);"   class="chageclass">包厢({{dataList.baoxiangNum}})</a>
      <span v-if="role.business_table_type" class="addclassify" @click="changeMask('.adddeskclassify')">添加茶座分类</span>
      <span class="f5 r3px tst2s" href="javascript:void(0)"  @click="refresh">刷新桌台</span>
      <div class="bench_condition right" id="static" >
        <a class="btngreen smallbtn r3px qbzt" :class="{'qbzt' : (typeId==0) , 'syz' : ( typeId==1) , 'yyd' : (typeId==2) , 'kxz' : (typeId==3)}"   style="z-index: 110" href="javascript:void(0);">{{stateName}}</a>
        <div class="dropdown_white  r5px "  id="downlist" style="z-index: 109">
          <a class="qbzt r3px" href="javascript:void(0);"  @click="stateChange(0,'全部状态');">全部状态</a>
          <a class="syz r3px" href="javascript:void(0);"  @click="stateChange(1,'使用中');">使用中</a>
          <a class="yyd r3px" href="javascript:void(0);"  @click="stateChange(2,'已预订');">已预订</a>
          <a class="kxz r3px" href="javascript:void(0);"  @click="stateChange(3,'空闲中');">空闲中</a>
        </div>
      </div>
      <div class="other_button right" v-if="role.order_btxf">
        <a class="r3px counter " @click="counter('.counterview',1)" href="javascript:void(0)">吧台消费</a>
      </div>
    </div>
    <!--业务导航切换/end-->
    <!--内容区-->
    <div class="bench white-scroll   businesslist" v-if="role.business_desktopstatus" style="z-index: 99">
      <!--大厅-->
      <div class="bench_entry  "  v-for="(data ,index) in dataList.data" :class="{ 'sanzuo': !data.classification ,'baojian' : data.classification } ">
        <span class="classifyshow">
          <b>{{data.cate_name}}</b> （{{data.classification_name}}）
          <a v-if="data.countShow==0 &&  role.business_table_type"   @click="deleteMask('.confirmshow',data.id,'('+data.cate_name+')茶座分类','classify')" alt="删除"> <i class="icon iconfont icon-shanchu" ></i></a>
          <a v-if="data.countShow==0 &&  role.business_table_type"   @click="editClassify('.editdeskclassify',data.id,data.cate_name,data.hour,data.price,data.type,data.classification_name);"  style="margin-left: 10px;" alt="修改编辑"> <i class="icon iconfont icon-bianji" ></i></a>
        </span>
        <ul class="clearfix">
          <li class=" r5px"  v-for="(val,index) in data.tables"  :class="{  'wt-coffice' : (val.use_type==3) || (val.use_type==1) || (val.use_type==5) || (val.use_type==6) , 'blk-gray' : (val.use_type==0), 'wt-green' : (val.use_type==2)}"    @click="operation(val.id,val.use_type,data.cate_name,val.table_name,val.people_num)">
            <div class="title"><b>{{val.table_name}}</b>({{val.people_num}}人)
              <a v-if="val.use_type==3 || val.use_type==6" class="he" href="javascript:void(0)" title="合并">合</a>
              <a v-if="val.use_type==5 || val.use_type==6" class="ding" href="javascript:void(0)" title="预订"  @click="bookingShow(val.id,data.cate_name,val.table_name)">订</a>
              <div class="deskdelete" v-if="val.use_type==0 && role.business_table"  >
                <a class=" delete" @click="deleteMask('.confirmshow',val.id,'('+data.cate_name+'-'+val.table_name+')茶座','desk')"><i class="icon iconfont icon-shanchu" style="font-size: 18px;" ></i>&nbsp;删除</a>
                <a class=" edit" @click="editDeskMask('.editdeskshow',val.id,val.table_name,val.people_num)"><i class="icon iconfont icon-bianji" style="font-size: 18px;"></i>&nbsp;修改</a>
              </div>
            </div>
            <div class="text showDelete" v-if="val.use_type==0">
              <p><i class="nullimg"></i><span class="nulltext">空闲</span></p>
            </div>
            <!--已定-->
            <div class="text" v-if=" val.use_type==3 || val.use_type==1 || val.use_type==5 || val.use_type==6">
              <div class="txtcon">已消费商品<font>{{val.order.total_amount}}</font>元</div>
              <div class="time">入座时长：{{val.order.time}}</div>
            </div>
            <!--预定-->
            <div class="text" v-if="val.use_type==2">
              <div class="txtcon" >{{val.book.username}}--已预订</div>
              <div class="time">预抵：{{val.book.arrive_time}}</div>
            </div>
           
          </li>
          <li  v-if="role.business_table" class=" r5px  deskadd " @click="changeMask('.addDesk',data.id);">
            <a href="javascript:void(0);">+</a>
          </li>
        </ul>
      </div>
      <!--大厅-->
      <div class=""></div>
    </div>
    <!--内容区/end-->
    <!--弹出层区-->
    <!--吧台消费-->
    <div class="newview viewroom r10px viewspendingroom  counterview" >
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="left">吧台消费</span>
          <a class="close right"   @click="closeMask('.counterview')" href="javascript:void(0);"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail nv_cont thin-scroll">
          <table border="0" cellpadding="0" cellspacing="0" class="spending_table">
            <tbody>
              <tr>
                <td><h3>可选消费项</h3></td>
                <td></td>
                <td><h3>已选消费项</h3></td>
              </tr>
            <tr>
              <td class="gtable" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" class="globaltable">
                  <tbody><tr>
                    <td>分类</td>
                    <td>名称</td>
                    <td>单价</td>
                    <td>库存</td>
                    <td>操作</td>
                  </tr>
                  <tr class="table_search">
                    <td>
                      <select class="ng-untouched ng-pristine ng-valid" v-model="goodsClass"  @change="search">
                        <option value="0">请选择分类</option>
                        <option  v-for="(classify,index) in categoryList"  :value="classify.id">{{classify.cate_name}}</option>
                      </select>
                    </td>
                    <td><input type="text" class="ng-untouched ng-pristine ng-valid" v-model="keyWords" @keyup="search"></td>
                    <td>-</td>
                    <td>-</td>
                    <td><a class="search r3px" href="javascript:void(0)"></a></td>
                  </tr>
                  </tbody>
                  <tbody>
                    <tr v-for="(goods,index) in goodsList">
                      <td>{{goods.cate_name}}</td>
                      <td>{{goods.goods_name}}</td>
                      <td>{{goods.sales_price}}元</td>
                      <td>{{goods.stock}}</td>
                      <td>
                        <a class="tianjia" href="javascript:void(0)" v-if="goods.stock>=1" @click="addgoodss(goods.id)">添加</a>
                        <a class="tianjia" href="javascript:void(0)" v-if="goods.stock>='-'" @click="addgoodss(goods.id)">添加</a>
                        <a class="tianjia" href="javascript:void(0)"  v-if="goods.stock==0 || goods.stock<1" >--</a>
                      </td>
                    </tr>
                  </tbody>
                  <tbody>
                  <tr>
                    <td colspan="6">
                      <div class="page clearfix">
                        <div class="text">共<b>{{goosDataList.pageNum}}</b>页<b>{{goosDataList.count}}</b>条记录</div>
                        <div class="linklist">
                          <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
                          <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in goodsPageList"   @click="changePage(pages);" >{{pages}}</a>
                          <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </td>
              <td class="icon" valign="middle"><i></i></td>
              <td class="ctable" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" class="globaltable">
                  <tbody>
                      <tr>
                        <td>名称</td>
                        <td>单价</td>
                        <td>金额</td>
                        <td>数量</td>
                        <td>操作</td>
                      </tr>
                      <tr v-for="(addGoods,index) in addGoodsList"  v-if="addGoods.count">
                        <td>{{addGoods.goods_name}}</td>
                        <td>{{addGoods.sales_price}}/{{addGoods.unit}}</td>
                        <td >{{addGoods.sales_price*addGoods.count}}元</td>
                        <td class="quantity">
                          <a class="r3px" href="javascript:void(0)"   @click="changecount(addGoods.id,'prev');">-</a>
                          <input style="margin-right: -16px;" type="number" :value="1"   v-model="addGoods.count"  id="inputNum"   @blur="inputNum(addGoods.id)" class="ng-untouched ng-pristine ng-valid">
                          <a class="r3px" href="javascript:void(0)"  @click="changecount(addGoods.id,'next');">+</a>
                        </td>
                        <td>
                          <a href="javascript:void(0);"  @click="removeGoods(addGoods.id);">移除</a>
                        
                        </td>
                      </tr>
                  </tbody>
                </table>
                <!--没有选择时显示-->
                <div class="center fs14 c666"  v-if="!goodTotal.count">请在左侧选择商品。</div>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="nv_btn clearfix">
          <a class="btngreen fr diandan" href="javascript:void(0)" @click="orderPay('bt')">点单完成</a>
          <div class="spending_price fr">共<b>{{goodTotal.count}}</b>件，总计：<strong>{{goodTotal.totalPrice}}</strong>元
          </div>
        </div>
      </div>
    </div>
    <!--吧台消费/end-->
    <!--开单-->
    <div class="drawerdetail flex flex-v disk deskempty">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">{{desk_No}}</span>
          <a class="close fr" @click="closeMask('.deskempty');"   href="javascript:void(0);"></a>
        </div>
        <div class="operate_opt in">
          <a  v-if="role.business_begin_table_order" class="kaidan r5px"  @click="changeMask('.openView');" href="javascript:void(0)">开单</a>
          <a v-if="role.business_book" class="yuding r5px"  @click="	changeMask('.bookmodel');" href="javascript:void(0)">预订</a>
        </div>
      </div>
    </div>
    <!--开单/end-->
    <!--开单弹出框-->
    <div class="viewroom thin-scroll r10px  openView">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">消费开单<i>（{{deskDteail.cate_name}}，{{deskDteail.table_name}}）</i></span>
          <a class="close fr"   @click="closeMask('.openView')" href="javascript:void(0);"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail">
          <div class="form_table">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody>
              <tr>
                <td>房间：</td>
                <td>{{deskDteail.cate_name}}</td>
               <td>桌号：</td>
               <td>{{deskDteail.table_name}}</td>
              </tr>
              <tr>
                <td>开单时间：</td>
                <td>
                  <input class="calendar hasDatepicker ng-pristine ng-valid ng-touched"   v-model="deskDteail.statrTime"  @click="selectDate('#txtBusinessCreateConsumeTime')"   id="txtBusinessCreateConsumeTime" type="text">
                </td>
                <td>顾客人数：</td>
                <td>
                  <input class="shorterbox ng-pristine ng-valid ng-touched" type="text" v-model="openNum">&nbsp;&nbsp;人
                </td>
              </tr>
               <tr>
                <td>员工：</td>
                <td>
                  <select class="ng-untouched ng-pristine ng-valid" v-model="staffId">
                        <option value="0">请选择员工</option>
                        <option v-for="(staff,index) in staffList" :value="staff.id">{{staff.user}}</option>
                      </select>
                </td>
              </tr>
              <tr class="remarks">
                <td valign="top">备注：</td>
                <td colspan="3"><textarea class="ng-pristine ng-valid ng-touched" v-model="openRemark"></textarea>
                </td>
              </tr>
              </tbody></table>
          </div>
          <div class="form_btn">
            <a class="btngreen kaidan"   @click="openOder(deskDteail.deskId)" href="javascript:void(0)">确定开单</a>
          </div>
        </div>
      </div>
    </div>
    <!--开单弹出框/end-->
    <!--预订-->
    <div class="viewroom  thin-scroll r10px bookmodel">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">预订<i>{{desk_No}}</i></span>
          <a class="close fr"  @click="closeMask('.bookmodel')"  href="javascript:void(0);"></a>
        </div>
        <div class="form_detail">
          <!--报错模板-->
          <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
          <div class="form_table">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td>房间：</td>
                <td>{{deskDteail.cate_name}}</td>
                <td>桌号：</td>
                <td>{{deskDteail.table_name}}</td>
              </tr>
              <tr>
                <td>座位数：</td>
                <td>{{deskDteail.p_num}} </td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>预订人：</td>
                <td><input type="text"  v-model="bookUserName" class="ng-untouched ng-pristine ng-valid"></td>
                <td>联系电话：</td>
                <td><input type="text"  v-model="bookPhone"  class="ng-untouched ng-pristine ng-valid"></td>
              </tr>
              <tr>
                <td>预抵时间：</td>
                <td><input   readonly="readonly"   v-model="deskDteail.statrTime"  class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="txtBusinessBookTime" style="font-weight: bold" type="text"  @click="selectDate('#txtBusinessBookTime');" /></td>
                <td>取消时间：</td>
                <td><input   readonly="readonly"  v-model="deskDteail.endTime" class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="txtBusinessBookCancelTime"  @click="selectDate('#txtBusinessBookCancelTime');" type="text"></td>
              </tr>
              <tr class="remarks">
                <td valign="top">客人留言：</td>
                <td colspan="3"><textarea v-model="bookLeaveMessage" class="ng-untouched ng-pristine ng-valid"></textarea></td>
              </tr>
              <tr class="remarks">
                <td valign="top">短信通知：</td>
                <td colspan="3"><textarea v-model="bookMessage" class="ng-untouched ng-pristine ng-valid"></textarea></td>
              </tr>
              </tbody></table>
          </div>
          <div class="form_btn">
            <a class="btngreen kaidan" @click="booking()" href="javascript:void(0)">预订</a>
          </div>
        </div>
      </div>
    </div>
    <!--预订/end-->
    <!--预订弹出框-->
    <div class="drawerdetail flex flex-v bookview">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
         <span class="fl">{{deskDteail.cate_name}}--{{deskDteail.table_name}}</span>
          <a class="close fr" @click="closeMask('.bookview');"    href="javascript:void(0);"></a>
        </div>
        <div class="theinfo">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>房间：</td>
              <td>{{deskDteail.cate_name}}</td>
             <td>桌号：</td>
             <td>{{deskDteail.table_name}}</td>
            </tr>
            <tr>
              <td>预订人：</td>
              <td>{{bookUserName}}</td>
              <td>联系电话：</td>
              <td>{{bookPhone}}</td>
            </tr>
            <tr>
              <td>预抵时间：</td>
              <td>{{deskDteail.statrTime}}</td>
              <td>取消时间：</td>
              <td>{{deskDteail.endTime}}</td>
            </tr>
            </tbody></table>
          <div class="remarks">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td>备&nbsp;&nbsp;&nbsp;注&nbsp;&nbsp;&nbsp;：</td>
                <td>{{bookLeaveMessage}}</td>
              </tr>
              </tbody></table>
          </div>
        </div>
      </div>
      <div class="dwdtl_btn">
       <a class="btngreen kaidan"   v-if="bookingShowBtn" @click="openBookMask('.openView','book');"   href="javascript:void(0)">预订开单</a>
       <a class="btngreen kaidan"  v-if="bookingShowBtn"   @click="changeMask('.openView');" href="javascript:void(0)">非预订开单</a>
       <a class="cancelorder sidelink fl" @click="cancelMake('.bookconfirmshow',chengeId);" href="javascript:void(0)">取消预订</a>
        <div class="clear"></div>
      </div>
    </div>
    <!--预订弹出框/end-->
    <!--已开单使用详情-->
    <div class="drawerdetail flex flex-v deskno">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">{{desk_No}}</span>
          <div class="dwdtl_topbtn fl">
            <a v-if="role.business_table_table_turn"  class="zhuotai r3px"  @click="changeMask('.changeDeskcon')" href="javascript:void(0)">更换桌台</a>
            <a v-if="role.business_merge" class="hebing r3px" @click="heDesk" href="javascript:void(0)">合并账单</a>
          </div>
          <a class="close fr" @click="closeMask('.deskno');"    href="javascript:void(0);"></a>
        </div>
        <div class="theinfo">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>开单时间：</td>
              <td>{{openDataList.start_time}}</td>
              <td>累计时长：</td>
              <td>{{openDataList.time}}</td>
            </tr>
            <tr>
              <td>顾客人数：</td>
              <td>{{openDataList.person}}人</td>
              <td>包间费用：</td>
              <td>￥{{openDataList.table_amount}}</td>
            </tr>
            </tbody></table>
        </div>
        <div class=""></div>
        <div class="theinfo_tbl">
          <div class="price_tab">
            <span class="current" @click="changeStatic(0)">商品清单(￥{{orderGoodTotal.ordertotalPrice}})</span>
            <span v-if="heOrederShow " @click="changeStatic(1)">合并账单(￥{{orderGoodTotal.hePrice}})</span>
          </div>
          <!--合并账单详情-->
          <div class="merged" v-if=" heDeskShow&&heOrederShow" >
            <ul>
              <li  v-for="(val,index) in heGoodsList" class="changehelist">
              <div class="mergedlist clearfix"><span class="fl">{{val.table_name}}</span><span class="fr">共<b>{{val.goods_num}}</b>件，总计<font>{{val.total_amount}}</font>元</span></div>
              <div class="globaltable r5px">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr class="mergedtabtit">
                    <td>名称</td>
                    <td>时间</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>金额</td>
                  </tr>
                  <tr class="mergedtabtit  " v-for="(data,index) in  val.goods_list" >
                    <td>{{data.goods_name}}</td>
                    <td>{{data.add_time}}</td>
                    <td>{{data.price}}</td>
                    <td>{{data.num}}</td>
                    <td>{{data.sum_price}}</td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </li>
            </ul>
          </div>
          <!--商品清单-->
          <div  v-if="!heDeskShow" class=" globaltable r5px">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody>
              <tr>
                <td>名称</td>
                <td>时间</td>
                <td>单价</td>
                <td>数量</td>
                <td>金额</td>
                <td>操作</td>
              </tr>
              <tr v-for="(openOrder,index) in openDataList.goods_list">
                <td >{{openOrder.goods_name}}<i class="pei"  v-if="openOrder.give==1"></i></td>
                <td>{{openOrder.add_time}}</td>
                <td>{{openOrder.price}}元</td>
                <td>{{openOrder.num}}{{openOrder.unit}}</td>
                <td>{{openOrder.sum_price}}元</td>
                <td>
                  <a href="javascript:void(0)" v-if="(openOrder.give==0 && openOrder.is_give==1 ) && role.business_goods_giv"  @click="givePei(openOrder.id,openOrder.order_id)">转配</a>
                  <a href="javascript:void(0)"  v-if="openOrder.is_goods==1 && role.business_table_goods_turn"   @click="openGoodsTurn(openOrder.id,openOrder.goods_name+'（'+openOrder.num+openOrder.spec+'）')">转台</a>
                  <a href="javascript:void(0)"  v-if="openOrder.is_goods==1 && role.business_add_goods"   @click="openGoodsconfirmshow(openOrder.id,openOrder.order_id)">取消</a>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
          <div class="price"  v-if="!heDeskShow" >
            共<b>{{orderGoodTotal.count}}</b>件，小计<font>{{orderGoodTotal.ordertotalPrice}}</font>元
          </div>
        </div>
      </div>
      <div class="dwdtl_btn">
        <a class="btnred fr paybill"  @click="orderPay('order')" href="javascript:void(0)">结账</a>
        <a class="btngreen fr increase"   @click="addOrder('.orderview',1)" href="javascript:void(0)">增加消费</a>
        <div class="total fl">总计<b>{{orderGoodTotal.totalPrice}}</b>元  &nbsp;&nbsp;&nbsp;&nbsp;茶豆币抵扣：<span style="color:red">{{cdbNum}}元</span>
        </div>
        <div class="clear"></div>
      </div>
    </div>
    <!--已开单使用详情、end-->
    <!--桌台结账-->
    <div class="newview viewroom r10px viewbillroom  ">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">结账单</span>
          <a class="close fr" @click="closeMask('.viewbillroom');" href="javascript:void(0);"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail nv_cont thin-scroll">
          <div class="form_billtable">
            <div class="roomtab">
              <select v-model="order_type" @change="changemore=false">
                <option  v-for="(orderClass,index) in accountsClassify" :value="orderClass.order_type">{{orderClass.name}}</option>
              </select>
              <div class="roomordernum" v-if="accountsClassify.length>1">
                合并账单：共{{accountsClassify.length}}个账单
              </div>
            </div>
            <div>
              <div class="globaltable r3px" id="order_list">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td>名称</td>
                      <td>单价</td>
                      <td>数量</td>
                      <td>金额</td>
                      <td>时间</td>
                    </tr>
                    <tr v-for="(order_list,index) in accountsList" v-if="order_list.order_type==order_type">
                      <td>{{order_list.table_name}}</td>
                      <td>{{order_list.price}}元</td>
                      <td>{{order_list.count}}</td>
                      <td>{{order_list.price_count}}元</td>
                      <td>{{order_list.time}}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <table border="0" cellpadding="0" cellspacing="0" style="height: 37px;text-align: center;border: 1px solid #ebe7e4;border-top: none;">
                <tbody>
                <tr class="tablemore" title="点击查看全部" @click="changemores()">
                  <td ><i></i></td>
                </tr>
                </tbody>
              </table>
            </div>
            <div>
            </div>
          </div>
          <div class="bill_pay_box flex">
            <div class="bill_pay_list">
              <h3>使用优惠</h3>
              <div class="bill_pay_tab">
                <ul class="clearfix flex">
                  <li :class="{'active':eqpaylist==0}" @click="changePayList(0)">
                    <label class="r3px"></label>会员
                  </li>
                  <li :class="{'active':eqpaylist==1}"  @click="changePayList(1)">
                    <label class="r3px"></label>手动优惠
                  </li>
                </ul>
              </div>
              <div class="bill_pay_conts">
                <div class="bill_input  paylist " v-show="eqpaylist==0">
                  <input  maxlength="20" placeholder="请输入会员手机号" v-model='memberphone' type="text" class="ng-pristine ng-valid ng-touched">
                  <a class="secondarybtn r3px" href="javascript:void(0)" @click="verifyPhone()">确定</a>
                </div>
                <div class="bill_input paylist " v-show="eqpaylist==1">
                  <input v-model="privilegepay"  @input="privilege()" maxlength="20" placeholder="请输入优惠价格" type="text" class="ng-pristine ng-valid ng-touched">元
                </div>
              </div>
            </div>
            <div class="bill_pay_list second flex-1">
              <h3>支付方式</h3>
              <div class="bill_pay_tab">
                <ul class="clearfix flex">
                  <li :class="{'active':eqpaylists==0}" @click="changePayLists(0)">
                    <label class="r3px " :class="{'current':cashpay>0}"></label>现金
                  </li>
                  <li :class="{'active':eqpaylists==1}"   @click="changePayLists(1)">
                    <label class="r3px" :class="{'current':swiping_card>0}"></label>刷卡
                  </li>
                  <li :class="{'active':eqpaylists==2}"  @click="changePayLists(2)">
                    <label class="r3px" :class="{'current':alipay>0}"></label>支付宝
                  </li>
                  <li :class="{'active':eqpaylists==3}"  @click="changePayLists(3)">
                    <label class="r3px" :class="{'current':wxpay>0}"></label>微信支付
                  </li>
                  <li :class="{'active':eqpaylists==4}"  @click="changePayLists(4)">
                    <label class="r3px" :class="{'current':memberpay>0}"></label>会员支付
                  </li>
                </ul>
              </div><div class="bill_pay_conts">
              <div class="bill_input">
                <p v-show="eqpaylists==0">
                  <input   placeholder="请输入客人现金付款金额" type="text" v-model="cashpay" @input="changeOrderPay('cashpay')"  class="ng-untouched ng-pristine ng-valid">元
                </p>
                <p v-show="eqpaylists==1">
                  <input  placeholder="请输入客人刷卡付款金额" type="text" v-model="swiping_card" @input="changeOrderPay('swiping_card')"   class="ng-untouched ng-pristine ng-valid">元
                </p>
                <p v-show="eqpaylists==2">
                  <input  placeholder="请输入客人支付宝付款金额" type="text" v-model="alipay" @input="changeOrderPay('cashpay')"  class="ng-untouched ng-pristine ng-valid">元
                </p>
                <p v-show="eqpaylists==3">
                  <input  placeholder="请输入客人微信付款金额" type="text" v-model="wxpay" @input="changeOrderPay('wxpay')"   class="ng-untouched ng-pristine ng-valid">元
                </p>
                <p v-show="eqpaylists==4&&memberShow">
                  <input  placeholder="请输入客人会员付款金额" type="text" v-model="memberpay" @input="changeOrderPay('memberpay')"   class="ng-untouched ng-pristine ng-valid">元&nbsp;(可用余额:<a style="color:red">{{memberData.vip_amount}}</a>)
                </p>
                <p v-if="eqpaylists==4&&memberShow==false">你没有可用的余额</p>
              </div>
            </div>

            </div>
          </div>
        </div>
        <div class="bill_statement">
          <div class="price">
            <ul>
              <li>应付金额：<b><font color="#e64c2e">{{orederTotalPrice}}</font></b>元&nbsp;&nbsp;&nbsp;&nbsp;茶豆币抵扣：<span  style="color:red">{{cdbNum}}</span>元</li>
            </ul>
          </div>
          <div class="button flex">
            <div class="free_select flex-1">
              <label>
                <input type="checkbox" v-model="is_exempt" :value="is_exempt" @click="exempt()" class="ng-untouched ng-pristine ng-valid">免单</label>
              <label>
                <input type="checkbox" :value="printShow" v-model="printShow" class="ng-untouched ng-pristine ng-valid">打印账单</label>
              <a class="dayin  " href="javascript:void(0)" @click="getReadyPrint()"><i></i>预打账单</a>
              <span v-if="orederTotalPrices<0" style="display:inline-block">找零：<font class="fs14" color="#e64c2e">{{Math.abs(orederTotalPrices)}}</font>元</span>
              <span v-if="orederTotalPrices>0"  style="display:inline-block">还需支付：<font class="fs14" color="#e64c2e">{{orederTotalPrices}}</font>元</span>
            </div>
            <div class="bill_submit">
              <a href="javascript:void(0)" v-if="orederTotalPrices!=0 && role.business_order" class="btngray paybill">结账</a>
              <a href="javascript:void(0)" v-if="orederTotalPrices==0 && role.business_order" @click="goToPay('order');" class="btnred paybill">{{is_exempt ? '免单' : '结账'}}</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--吧台结账-->
    <div style="width: 890px;" class="newview viewroom r10px viewbillroom_bt">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">结账单</span>
          <a class="close fr" @click="closeMask('.viewbillroom_bt');" href="javascript:void(0);"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail nv_cont thin-scroll">
          <div class="form_billtable">
            <div class="roomtab">
              <select  >
                <option >吧台消费(￥{{goodTotal.totalPrice}})</option>
              </select>
              <div class="roomordernum" v-if="accountsClassify.length>1">
                
              </div>
            </div>
            <div>
              <div class="globaltable r3px" id="order_lists">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr>
                    <td>名称</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>金额</td>
                    <td>时间</td>
                  </tr>
                  <tr v-for="(order_lists,index) in addGoodsList" >
                    <td>{{order_lists.goods_name}}</td>
                    <td>{{order_lists.sales_price}}元</td>
                    <td>{{order_lists.count}}</td>
                    <td>{{Number(order_lists.count)*Number(order_lists.sales_price)}}元</td>
                    <td>{{order_lists.add_time}}</td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <table border="0" cellpadding="0" cellspacing="0" style="height: 37px;text-align: center;border: 1px solid #ebe7e4;border-top: none;">
                <tbody>
                <tr class="tablemore" title="点击查看全部" @click="changemores()">
                  <td ><i></i></td>
                </tr>
                </tbody>
              </table>
            </div>
            <div>
            </div>
          </div>
          <div class="bill_pay_box flex">
            <div class="bill_pay_list">
              <h3>使用优惠</h3>
              <div class="bill_pay_tab">
                <ul class="clearfix flex">
                  <li :class="{'active':eqpaylist==0}" @click="changePayList(0)">
                    <label class="r3px"></label>会员
                  </li>
                  <li :class="{'active':eqpaylist==1}"  @click="changePayList(1)">
                    <label class="r3px"></label>手动优惠
                  </li>
                </ul>
              </div>
              <div class="bill_pay_conts">
                <div class="bill_input  paylist " v-show="eqpaylist==0">
                  <input  maxlength="20" placeholder="请输入会员手机号" v-model='memberphone' type="text" class="ng-pristine ng-valid ng-touched">
                  <a class="secondarybtn r3px" href="javascript:void(0)" @click="verifyPhone()">确定</a>
                </div>
                <div class="bill_input paylist " v-show="eqpaylist==1">
                  <input v-model="privilegepay"  @input="privilege()" maxlength="20" placeholder="请输入优惠价格" type="text" class="ng-pristine ng-valid ng-touched">元
                </div>
              </div>
            </div>
            <div class="bill_pay_list second flex-1">
              <h3>支付方式</h3>
              <div class="bill_pay_tab">
                <ul class="clearfix flex">
                  <li :class="{'active':eqpaylists==0}" @click="changePayLists(0)">
                    <label class="r3px " :class="{'current':cashpay>0}"></label>现金
                  </li>
                  <li :class="{'active':eqpaylists==1}"   @click="changePayLists(1)">
                    <label class="r3px" :class="{'current':swiping_card>0}"></label>刷卡
                  </li>
                  <li :class="{'active':eqpaylists==2}"  @click="changePayLists(2)">
                    <label class="r3px" :class="{'current':alipay>0}"></label>支付宝
                  </li>
                  <li :class="{'active':eqpaylists==3}"  @click="changePayLists(3)">
                    <label class="r3px" :class="{'current':wxpay>0}"></label>微信支付
                  </li>
                  <li :class="{'active':eqpaylists==4}"  @click="changePayLists(4)">
                    <label class="r3px" :class="{'current':memberpay>0}"></label>会员支付
                  </li>
                </ul>
              </div><div class="bill_pay_conts">
              <div class="bill_input">
                <p v-show="eqpaylists==0">
                  <input   placeholder="请输入客人现金付款金额" type="text" v-model="cashpay" @input="changeOrderPay('cashpay')"  class="ng-untouched ng-pristine ng-valid">元
                </p>
                <p v-show="eqpaylists==1">
                  <input  placeholder="请输入客人刷卡付款金额" type="text" v-model="swiping_card" @input="changeOrderPay('swiping_card')"   class="ng-untouched ng-pristine ng-valid">元
                </p>
                <p v-show="eqpaylists==2">
                  <input  placeholder="请输入客人支付宝付款金额" type="text" v-model="alipay" @input="changeOrderPay('cashpay')"  class="ng-untouched ng-pristine ng-valid">元
                </p>
                <p v-show="eqpaylists==3">
                  <input  placeholder="请输入客人微信付款金额" type="text" v-model="wxpay" @input="changeOrderPay('wxpay')"   class="ng-untouched ng-pristine ng-valid">元
                </p>
                <p v-show="eqpaylists==4&&memberShow">
                  <input  placeholder="请输入客人会员付款金额" type="text" v-model="memberpay" @input="changeOrderPay('memberpay')"   class="ng-untouched ng-pristine ng-valid">元&nbsp;(可用余额:<a style="color:red">{{memberData.vip_amount}}</a>)
                </p>
                <p v-if="eqpaylists==4&&memberShow==false">你没有可用的余额</p>
              </div>
            </div>
          
            </div>
          </div>
        </div>
        <div class="bill_statement">
          <div class="price">
            <ul>
              <li>应付金额：<b><font color="#e64c2e">{{orederTotalPrice}}</font></b>元</li>
            </ul>
          </div>
          <div class="button flex">
            <div class="free_select flex-1">
              <label>
                <input type="checkbox" v-model="is_exempt" :value="is_exempt" @click="exempt()" class="ng-untouched ng-pristine ng-valid">免单</label>
              <label>
                <input type="checkbox" :value="printShow" v-model="printShow" class="ng-untouched ng-pristine ng-valid">打印账单</label>
              <a class="dayin  " href="javascript:void(0)" @click="getReadyPrint('bt')"><i></i>预打账单</a>
              <span v-if="orederTotalPrices<0" style="display:inline-block">找零：<font class="fs14" color="#e64c2e">{{Math.abs(orederTotalPrices)}}</font>元</span>
              <span v-if="orederTotalPrices>0"  style="display:inline-block">还需支付：<font class="fs14" color="#e64c2e">{{orederTotalPrices}}</font>元</span>
            </div>
            <div class="bill_submit">
              <a href="javascript:void(0)" v-if="orederTotalPrices!=0" class="btngray paybill">结账</a>
              <a href="javascript:void(0)" v-if="orederTotalPrices==0" @click="goToPay('bt');" class="btnred paybill">{{is_exempt ? '免单' : '结账'}}</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--结账、end-->
    <!--合并账单-->
    <div class="newview r10px  heDesk">
      <div class="nv_cap clearfix"><span class="fl">合并账单</span>
        <a class="close fr" @click="closeMask('.heDesk');" href="javascript:void(0);"></a>
      </div>
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="nv_cont thin-scroll">
        <dl v-for="(deskClass,index) in heDeskList" v-if="deskClass.tables.length!=0">
          <dt>{{deskClass.cate_name}}</dt>
          <dd v-for="(deskItem,index) in deskClass.tables"   v-if="deskItem.id !=deskDteail.deskId">
            <label>
              <input type="checkbox" :value="deskItem.id" v-model="heDeskDataId">
              {{deskItem.table_name}}
            </label>
          </dd>
        </dl>
      </div>
      <div class="nv_btn"><a class="btngreen queding"  @click="heConfirm"  href="javascript:void(0)">确定</a></div>
    </div>
    <!--合并账单/end-->
    <!--更换包间-->
    <div class="viewsmall form_cont r10px  changeDeskcon ">
      <div class="form_cap clearfix">
        <span class="fl">更换桌台/包间</span>
        <a class="close fr" @click="closeMask('.changeDeskcon')" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>房间分类：</td>
              <td>
                <select class="ng-untouched ng-pristine ng-valid" v-model="zhuantaiClass" @change="changeDesk">
                  <option value="0" >请选择房间分类</option>
                  <option v-for="(data ,index) in dataList.data"  :value="data.id">{{data.cate_name}}</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>桌台/包间：</td>
              <td>
                <select class="ng-untouched ng-pristine ng-valid"  v-model="zhuantaiDesk">
                  <option value="0">请选择桌台/包间</option>
                  <option v-for="(val,index) in zhuantaiList" :value="val.id">{{val.table_name}}</option>
                </select>
              </td>
            </tr>
            </tbody></table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" @click="changeDeskConfirm" href="javascript:void(0);">确定更换</a>
        </div>
      </div>
    </div>
    <!--更换包间/end-->
    <!--增加茶座-->
    <div class="viewsmall form_cont r10px   addDesk">
      <div class="form_cap clearfix">
        <span class="fl">添加桌台/包间</span>
        <a class="close fr" @click="closeMask('.addDesk');" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>桌台名称：</td>
              <td>
                <input name="deskname" type="text" class="ng-untouched ng-pristine ng-valid" v-model="deskname "    placeholder="输入台桌名称"/>
              </td>
            </tr>
            <tr>
              <td>可坐人数：</td>
              <td>
                <input name="deskpnum" type="text" class="ng-untouched ng-pristine ng-valid" v-model="deskpnum" placeholder="输入可坐人数"/>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);"  @click="addDesk(0)" >确定增加</a>
        </div>
      </div>
    </div>
    <!--增加茶座/end-->
    <!--添加茶座分类-->
    <div class="viewsmall form_cont r10px   adddeskclassify">
      <div class="form_cap clearfix">
        <span class="fl">添加茶座分类</span>
        <a class="close fr" @click="closeMask('.adddeskclassify');" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
              <tr>
                <td>分类名称：</td>
                <td>
                  <input name="classifyname"  type="text" class="ng-untouched ng-pristine ng-valid" v-model="classifyname "    placeholder="输入茶座分类名称"/>
                </td>
              </tr>
              <tr>
                <td>茶座分类：</td>
                <td>
                  <select   class="ng-untouched ng-pristine ng-valid" v-model="deskClassify">
                    <option value="0">散座</option>
                    <option value="1">包厢</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td>计费类型：</td>
                <td>
                  <select   class="ng-untouched ng-pristine ng-valid" v-model="billingClassify">
                    <option value="1">小时计费</option>
                    <option value="2">包段</option>
                    <option value="3">免费</option>
                  </select>
                </td>
              </tr>
              <tr v-if="billingClassify==2">
                <td>时段：</td>
                <td>
                  <input name="timeFrame"  type="text" class="ng-untouched ng-pristine ng-valid" v-model="timeFrame "    placeholder="输入时段"/>
                </td>
              </tr>
              <tr  v-if="billingClassify==1 || billingClassify==2">
                <td>价格：</td>
                <td>
                  <input name="deskPrice"  type="text" class="ng-untouched ng-pristine ng-valid" v-model="deskPrice "    placeholder="输入茶座价格"/>
                </td>
              </tr>
            
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);"  @click="addClassify(0)" >确定增加</a>
        </div>
      </div>
    </div>
    <!--添加茶座分类/end-->
    <!--二次确认-->
    <div class="viewsmall form_cont r10px   confirmshow ">
      <div class="form_cap clearfix">
        <span class="fl">确认删除？</span>
        <a class="close fr" @click="closeMask('.confirmshow');" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td style="text-align: center" >您确定删除<span style="color: red;">{{deleteDeskName}}</span>吗？</td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);"  @click="closeMask('.confirmshow')"  style="width: 45%;float: right;background: #999;">取消</a>
          <a class="btngreen baocun" href="javascript:void(0);"  @click="deleteConfirm()"  style="width: 45%;float: left;">确定</a>
        </div>
      </div>
    </div>
    <!--二次确认/end-->
    <!--预约取消确认-->
    <div class="viewsmall form_cont r10px   bookconfirmshow ">
      <div class="form_cap clearfix">
        <span class="fl">确认取消？</span>
        <a class="close fr" @click="closeMask('.bookconfirmshow');" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td style="text-align: center" >您确定取消该房间预订吗？</td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);"  @click="closeMask('.bookconfirmshow')"  style="width: 45%;float: right;background: #999;">取消</a>
          <a class="btngreen baocun" href="javascript:void(0);"  @click="rBookConfirm()"  style="width: 45%;float: left;">确定</a>
        </div>
      </div>
    </div>
    <!--预约取消确认/end-->
    <!--商品取消确认-->
    <div class="viewsmall form_cont r10px   openGoodsconfirmshow ">
      <div class="form_cap clearfix">
        <span class="fl">确认取消？</span>
        <a class="close fr" @click="closeMask('.openGoodsconfirmshow');" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td style="text-align: center" >您确定取消该商品吗？</td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);"  @click="closeMask('.openGoodsconfirmshow')"  style="width: 45%;float: right;background: #999;">取消</a>
          <a class="btngreen baocun" href="javascript:void(0);"  @click="openGoodsCancelConfirm()"  style="width: 45%;float: left;">确定</a>
        </div>
      </div>
    </div>
    <!--商品取消确认/end-->
    <!--商品转配确认-->
    <div class="viewsmall form_cont r10px   openGivePeiconfirmshow ">
      <div class="form_cap clearfix">
        <span class="fl">确认转配？</span>
        <a class="close fr" @click="closeMask('.openGoodsconfirmshow');" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td style="text-align: center" >您确认将该商品转为配茶吗？</td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);"  @click="closeMask('.openGivePeiconfirmshow')"  style="width: 45%;float: right;background: #999;">取消</a>
          <a class="btngreen baocun" href="javascript:void(0);"  @click="openGivePeiConfirm()"  style="width: 45%;float: left;">确定</a>
        </div>
      </div>
    </div>
    <!--商品转配确认/end-->
    <!--编辑茶座-->
    <div class="viewsmall form_cont r10px   editdeskshow">
      <div class="form_cap clearfix">
        <span class="fl">修改桌台/包间</span>
        <a class="close fr" @click="closeMask('.editdeskshow');" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>桌台名称：</td>
              <td>
                <input name="deskname"  type="text" class="ng-untouched ng-pristine ng-valid" v-model="deskname "    placeholder="输入台桌名称"/>
              </td>
            </tr>
            <tr>
              <td>可坐人数：</td>
              <td>
                <input name="deskpnum" type="text" class="ng-untouched ng-pristine ng-valid" v-model="deskpnum" placeholder="输入可坐人数"/>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);"  @click="addDesk(1)" >确定修改</a>
        </div>
      </div>
    </div>
    <!--编辑茶座/end-->
    <!--编辑茶座分类-->
    <div class="viewsmall form_cont r10px   editdeskclassify">
      <div class="form_cap clearfix">
        <span class="fl">编辑茶座分类</span>
        <a class="close fr" @click="closeMask('.editdeskclassify');" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>分类名称：</td>
              <td>
                <input name="classifyname"  type="text" class="ng-untouched ng-pristine ng-valid" v-model="classifyname "    placeholder="输入茶座分类名称"/>
              </td>
            </tr>
            <tr>
              <td>茶座分类：</td>
              <td>
                <select   class="ng-untouched ng-pristine ng-valid" v-model="deskClassify">
                  <option value="0">散座</option>
                  <option value="1">包厢</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>计费类型：</td>
              <td>
                <select   class="ng-untouched ng-pristine ng-valid" v-model="billingClassify">
                  <option value="1">小时计费</option>
                  <option value="2">包段</option>
                  <option value="3">免费</option>
                </select>
              </td>
            </tr>
            <tr v-if="billingClassify==2">
              <td>时段：</td>
              <td>
                <input name="timeFrame"  type="text" class="ng-untouched ng-pristine ng-valid" v-model="timeFrame "    placeholder="输入时段"/>
              </td>
            </tr>
            <tr  v-if="billingClassify==1 || billingClassify==2">
              <td>价格：</td>
              <td>
                <input name="deskPrice"  type="text" class="ng-untouched ng-pristine ng-valid" v-model="deskPrice "    placeholder="输入茶座价格"/>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);"  @click="addClassify(1)" >确定修改</a>
        </div>
      </div>
    </div>
    <!--编辑茶座分类/end-->
    <!--开单消费选择商品-->
    <div class="newview viewroom r10px viewspendingroom orderview" >
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="left">增加消费<i>（{{desk_No}}）</i></span>
          <a class="close right"   @click="closeMask('.orderview')" href="javascript:void(0);"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail nv_cont thin-scroll">
          <table border="0" cellpadding="0" cellspacing="0" class="spending_table">
            <tbody>
            <tr>
              <td><h3>可选消费项</h3></td>
              <td></td>
              <td><h3>已选消费项</h3></td>
            </tr>
            <tr>
              <td class="gtable" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" class="globaltable">
                  <tbody>
                  <tr>
                    <td>分类</td>
                    <td>名称</td>
                    <td>单价</td>
                    <td>库存</td>
                    <td>操作</td>
                  </tr>
                  <tr class="table_search">
                    <td>
                      <select class="ng-untouched ng-pristine ng-valid" v-model="goodsClass"  @change="search">
                        <option value="0">请选择分类</option>
                        <option  v-for="(classify,index) in categoryList"  :value="classify.id">{{classify.cate_name}}</option>
                      </select>
                    </td>
                    <td><input type="text" class="ng-untouched ng-pristine ng-valid" v-model="keyWords" @keyup="search"></td>
                    <td>-</td>
                    <td>-</td>
                    <td><a class="search r3px" href="javascript:void(0)"></a></td>
                  </tr>
                  </tbody>
                  <tbody>
                  <tr v-for="(goods,index) in goodsList">
                    <td>{{goods.cate_name}}</td>
                    <td>{{goods.goods_name}}</td>
                    <td>{{goods.sales_price}}元</td>
                    <td>{{goods.stock}}</td>
                    <td>
                      <a class="tianjia" href="javascript:void(0)" v-if="goods.stock>=1" @click="addgoodss(goods.id)">添加</a>
                      <a class="tianjia" href="javascript:void(0)" v-if="goods.stock>='-'" @click="addgoodss(goods.id)">添加</a>
                      <a class="tianjia" href="javascript:void(0)"  v-if="goods.stock==0 || goods.stock<1" >--</a>
                    </td>
                  </tr>
                  </tbody>
                  <tbody>
                  <tr>
                    <td colspan="6">
                      <div class="page clearfix">
                        <div class="text">共<b>{{goosDataList.pageNum}}</b>页<b>{{goosDataList.count}}</b>条记录</div>
                        <div class="linklist">
                          <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
                          <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in goodsPageList"   @click="changePage(pages);" >{{pages}}</a>
                          <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </td>
              <td class="icon" valign="middle"><i></i></td>
              <td class="ctable" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" class="globaltable">
                  <tbody>
                  <tr>
                    <td>名称</td>
                    <td>单价</td>
                    <td>金额</td>
                    <td>数量</td>
                    <td>操作</td>
                  </tr>
                  <tr v-for="(addGoods,index) in addGoodsList"  v-if="addGoods.count">
                    <td>{{addGoods.goods_name}}</td>
                    <td>{{addGoods.sales_price}}/{{addGoods.unit}}</td>
                    <td >{{addGoods.sales_price*addGoods.count}}元</td>
                    <td class="quantity">
                      <a class="r3px" href="javascript:void(0)"   @click="changecount(addGoods.id,'prev');">-</a>
                      <input style="margin-right: -16px;" type="number" :value="addGoods.count"   v-model="addGoods.count"     @@blur="inputNum(addGoods.id)" class="ng-untouched ng-pristine ng-valid">
                      <a class="r3px" href="javascript:void(0)"  @click="changecount(addGoods.id,'next');">+</a>
                    </td>
                    <td><a href="javascript:void(0);"  @click="removeGoods(addGoods.id);">移除</a></td>
                  </tr>
                  </tbody>
                </table>
                <!--没有选择时显示-->
                <div class="center fs14 c666"  v-if="!goodTotal.count">请在左侧选择商品。</div>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="nv_btn clearfix">
          <a class="btngreen fr diandan"   @click="confirmOrder" href="javascript:void(0)">点单完成</a>
          <div class="spending_price fr">共<b>{{goodTotal.count}}</b>件，总计：<strong>{{goodTotal.totalPrice}}</strong>元
          </div>
        </div>
      </div>
    </div>
    <!--开单消费选择商品/end-->
    <!--转台弹出框-->
    <div class="viewsmall form_cont r10px zhuantai">
      <div class="form_cap clearfix">
        <span class="fl">消费商品转台</span>
        <a class="close fr"  @click="closeMask('.zhuantai');" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>消费商品：</td>
              <td>{{openCancelName}}</td>
            </tr>
            <tr>
              <td>房间分类：</td>
              <td>
                <select class="ng-pristine ng-valid ng-touched" v-model="zhuantaiClass" @change="changeClass">
                  <option value="0">请选择房间分类</option>
                  <option v-for="(data ,index) in dataList.data"  :value="data.id">{{data.cate_name}}</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>桌台/包间：</td>
              <td>
                <select class="ng-pristine ng-valid ng-touched" v-model="zhuantaiDesk">
                  <option value="0">请选择桌台/包间</option>
                  <option v-for="(val,index) in zhuantaiList" :value="val.id">{{val.table_name}}</option>
                </select>
              </td>
            </tr>
            </tbody></table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun"  @click="zhuantaiConfirm"  href="javascript:void(0);">确定转台</a>
        </div>
      </div>
    </div>
    <!--转台弹出框/end-->
    <!--遮罩-->
    <div>
      <div class="bgblack "></div>
    </div>
    <!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
    <!--弹出层区、end-->
    <!--账单打印-->
    <div style="opacity: 0">
      <div   class="asdasd" id="divCustomerRechargePrint" >
        
        <div v-if="btOrderId==''" style="padding: 15px;margin: 0;" >
          <!--主张单-->
          <div style="margin-top: 15px;">
            <h2 style="display:block; text-align:center; height:24px; overflow:hidden; margin:0; padding:0; line-height:24px;font-size: 16px;">
              <主帐单>{{openDataList.table_name}}账单
            </h2>
            <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed;padding-bottom:15px; width:100%;margin-top: 10px;">
              <tbody>
              <tr style="height: 30px">
                <td>台座/房间：</td>
                <td>{{openDataList.table_name}}</td>
              </tr>
              <tr style="height: 30px">
                <td>开单时间：</td>
                <td>{{openDataList.start_time}}</td>
              </tr>
              </tbody></table>
            <table border="0" cellpadding="0" cellspacing="0" style="color:#666;border-bottom:#666 1px dashed; padding-bottom:15px; width:100%; ">
              <tbody>
              <tr style="height: 30px; border-bottom: 1px solid #ccc;">
                <td>名称</td>
                <td style="width: 150px;">单价(元)</td>
                <td style="width: 150px;">数量</td>
              </tr>
              <tr  style="height: 30px;" v-for="(printGoods,index) in openDataList.goods_list">
                <td>{{printGoods.goods_name}}</td>
                <td style="width: 150px;">{{printGoods.price}}元</td>
                <td style="width: 150px;">{{printGoods.num}}/{{printGoods.spec}}</td>
              </tr>
              </tbody>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" style="color:#666;border-bottom:#666 1px dashed; padding-bottom:15px; width:100%; ">
              <tbody>
              <tr  style="height: 25px;">
                <td >商品总额：</td>
                <td style="width: 150px;">{{orderGoodTotal.ordertotalPrice}}元</td>
              </tr>
              <tr  style="height: 25px;">
                <td >包间费用：</td>
                <td style="width: 150px;">{{openDataList.table_amount}}元</td>
              </tr>
              </tbody>
            </table>
          </div>
          <!--主账单/end-->
          <!--合并账单-->
          <div style="margin-top: 15px;" v-if="heGoodsList.length!=0" v-for="(printHeGoods,index) in heGoodsList">
            <h2 style="display:block; text-align:center; height:24px; overflow:hidden; margin:0; padding:0; line-height:24px;font-size: 16px;">
              <子张单>{{printHeGoods.table_name}}账单
            </h2>
            <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed;padding-bottom:15px; width:100%;margin-top: 10px;">
              <tbody>
              <tr style="height: 30px">
                <td>台座/房间：</td>
                <td>{{printHeGoods.table_name}}</td>
              </tr>
              <tr style="height: 30px">
                <td>开单时间：</td>
                <td>{{printHeGoods.start_time}}</td>
              </tr>
              </tbody></table>
            <table border="0" cellpadding="0" cellspacing="0" style="color:#666;border-bottom:#666 1px dashed; padding-bottom:15px; width:100%; ">
              <tbody>
              <tr style="height: 30px;    border-bottom: 1px solid #ccc;">
                <td>名称</td>
                <td style="width: 150px;">单价(元)</td>
                <td style="width: 150px;">数量</td>
              </tr>
              <tr  style="height: 30px;" v-for="(printHeGoodsList,index) in printHeGoods.goods_list">
                <td>{{printHeGoodsList.goods_name}}</td>
                <td style="width: 150px;">{{printHeGoodsList.price}}元</td>
                <td style="width: 150px;">{{printHeGoodsList.num}}/{{printHeGoodsList.spec}}</td>
              </tr>
              </tbody>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" style="color:#666;border-bottom:#666 1px dashed; padding-bottom:15px; width:100%; ">
              <tbody>
              <tr  style="height: 30px;">
                <td >商品总额：</td>
                <td style="width: 150px;">{{printHeGoods.total_amount}}元</td>
              </tr>
              </tbody>
            </table>
          </div>
          <!--合并账单/end-->
          <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed; padding-bottom:15px; width:100%;">
            <tbody>
            <tr>
              <td>合计总额：</td>
              <td style="width: 150px;">{{orederTotalPrice+Number(cdbNum)+Number(privilegepay)}}元</td>
            </tr>
            <tr style="height: 30px;">
              <td>优惠金额：</td>
              <td>{{privilegepay==''?0:privilegepay}}元</td>
            </tr>
            <tr style="height: 30px;">
              <td>茶豆币支付：</td>
              <td>{{cdbNum==''?0:cdbNum}}元</td>
            </tr>
            <tr style="height: 30px;">
              <td>应付款：</td>
              <td style="font-size: 18px;color: #222;font-weight: 600">{{orederTotalPrice}}元</td>
            </tr>
            </tbody>
          </table>
        </div>
        <div v-if="btOrderId!=''" style="padding: 15px;margin: 0;" >
          <!--主张单-->
          <div style="margin-top: 15px;">
            <h2 style="display:block; text-align:center; height:24px; overflow:hidden; margin:0; padding:0; line-height:24px;font-size: 16px;">
              吧台消费账单
            </h2>
            <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed;padding-bottom:15px; width:100%;margin-top: 10px;">
              <tbody>
              <tr style="height: 30px">
                <td>开单时间：</td>
                <td>{{addGoodsList[0]['add_time']}}</td>
              </tr>
              </tbody></table>
            <table border="0" cellpadding="0" cellspacing="0" style="color:#666;border-bottom:#666 1px dashed; padding-bottom:15px; width:100%; ">
              <tbody>
              <tr style="height: 30px; border-bottom: 1px solid #ccc;">
                <td>名称</td>
                <td style="width: 150px;">单价(元)</td>
                <td style="width: 150px;">数量</td>
              </tr>
              <tr  style="height: 30px;" v-for="(printGoodsss,index) in addGoodsList">
                <td>{{printGoodsss.goods_name}}</td>
                <td style="width: 150px;">{{printGoodsss.sales_price}}元</td>
                <td style="width: 150px;">{{printGoodsss.count}}/{{printGoodsss.unit}}</td>
              </tr>
              </tbody>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" style="color:#666;border-bottom:#666 1px dashed; padding-bottom:15px; width:100%; ">
              <tbody>
              <tr  style="height: 25px;">
                <td >商品总额：</td>
                <td style="width: 150px;">{{orderGoodTotal.ordertotalPrice}}元</td>
              </tr>
              <tr  style="height: 25px;">
                <td >包间费用：</td>
                <td style="width: 150px;">{{openDataList.table_amount}}元</td>
              </tr>
              </tbody>
            </table>
          </div>
          <!--主账单/end-->
          <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed; padding-bottom:15px; width:100%;">
            <tbody>
            <tr>
              <td>合计总额：</td>
              <td style="width: 150px;">{{orederTotalPrice+Number(privilegepay)}}元</td>
            </tr>
            <tr style="height: 30px;">
              <td>优惠金额：</td>
              <td>{{privilegepay==''?0:privilegepay}}元</td>
            </tr>
            <tr style="height: 30px;">
              <td>应付款：</td>
              <td style="font-size: 18px;color: #222;font-weight: 600">{{orederTotalPrice}}元</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <!--账单打印、end-->
  </div>
</template>
<script>
//  $(function () {
//    $('#printContent').printArea();
//  })
import {mapGetters,mapActions} from 'vuex';
  export  default{
    data(){
      return {
        classifyname: '',//分类名称
        timeFrame: '',//时段
        deskPrice: '',//价格
        billingClassify: 1,
        deskClassify: 0,
        deskpnum: '',
        deskname: '',
        chengeId: '',
        desk_No: '',
        iSsuccess:false,
        isLoading: false,
        msgShow: false,
        msg: '',
        dataList: [],
        page: 1,
        goosDataList: [],
        categoryList: [],
        goodsList: [],
        goodTotal: {
          totalPrice: 0,
          count: 0
        },
        orderGoodTotal: {
          ordertotalPrice: 0,
          count: 0,
          totalPrice: 0,
          hePrice:0
        },
        goodsPageList: [],
        addGoodsList: [],
        pageIsSearch: false,
        deleteDeskName: '',
        typeId: 0,
        stateName: '全部状态',
        deleteType: '',
        keyWords: '',
        goodsClass: 0,
        deskDteail: {
          deskId: '',
          cate_name: '',
          table_name: '',
          p_num: '',
          statrTime: '',
          endTime: ''
        },
        openCancelParentId:'',
        bookUserName: '',//预定人姓名
        bookPhone: '',//预定人电话
        bookLeaveMessage: '',//预定人留言
        bookMessage: '',//预定人
        openRemark: '',//开单备注
        openNum: 4,//开单顾客人数
        bookingShowBtn:true,
        bookType: '',
        openDataList: [],
        openCancelId:'',
        openCancelName:'',
        zhuantaiClass:0,
        zhuantaiDesk:0,
        zhuantaiList:[],
        heDeskDataId:[],
        heDeskList:[],
        heOrederShow:false,
        heDeskShow:false,
        heGoodsList:[],
        staffList:[],
        staffId:0,
        updateClassifyShow:true,
        accountsList:[],//结账账单数据列表
        accountsClassify:[],//结账账单分类
        order_type:'',
        changemore:false,
        orederTotalPrice:0,
        orederTotalPrices:0,
        //支付
        alipay:'',//支付宝
        wxpay:'',//微信
        memberpay:'',//会员支付
        privilegepay:'',//优惠
        swiping_card:'',//刷卡
        cashpay:'',//现金
        eqpaylist:0,
        eqpaylists:0,
        memberShow:false,
        memberphone:'',
        memberData:[],
        youhuiList:[],
        cdbNum:0,
        is_exempt:false,
        printShow:false,
        btOrderId:'',
        role: [],
        timer:'',
      }
    },
    methods: {
      //手动更改商品数量
      inputNum(id){
        this.getTotalPrice();
      },
      //  0（未开），1（已开，但没有合并），2（预定），3（合并）
      operation(id, sts, cate_name, table_name, p_num){
        this.bookingShowBtn=true;
        this.desk_No = cate_name + "-" + table_name;
        var myDate = this.initDate();
        var _this = this;
        this.deskDteail = {
          deskId: id,
          cate_name: cate_name,
          table_name: table_name,
          p_num: p_num,
          statrTime: myDate.statrTime,
          endTime: myDate.endTime
        };
        this.bookMessage = '恭喜，您已成功预订：小张（' + cate_name + '，' + table_name + '），预订到店时间：' + this.deskDteail.statrTime + '，祝您消费愉快！'
        if (sts == 1 || sts == 3 || sts==5 || sts==6) {
          if(!this.role['business_orderInfo']){
            return
          }
          _this.heGoodsList=[];
          this.ajax(_this.port.getorderone, {table_id: id}, 'GET', function (res) {
            if (res.code == 1) {
              _this.openDataList = res.data;
              _this.cdbNum = Number(res.data['beans_amount']) ;
              if(res.data['merge_order'].length==0){
              	_this.heOrederShow=false;
                _this.heDeskShow=false;
              }else{
                _this.heGoodsList=res.data['merge_order'];
                _this.heOrederShow=true;
              }
              _this.getOpenOrder();
            }
          })
          $('.deskno').addClass('in');
          $('.deskempty').removeClass('in');
          $('.bookview').removeClass('in');
  
        } else if (sts == 2) {
          if(!this.role['business_book']){
            return
          }
          this.ajax(this.port.getbook, {table_id: id}, 'GET', function (res) {
            if (res.code == 1) {
              _this.bookLeaveMessage = res.data.notes;
              _this.bookUserName = res.data.username;
              _this.bookPhone = res.data.phone;
              _this.deskDteail.statrTime = res.data.arrive_time;
              _this.deskDteail.endTime = res.data.send_time;
            }
          })
          $('.deskno').removeClass('in');
          $('.bookview').addClass('in');
          $('.deskempty').removeClass('in');
        } else {
          $('.deskempty').addClass('in');
          $('.deskno').removeClass('in');
          $('.bookview').removeClass('in');
        }
      },
      //预定开单后点击'订'事件处理
      bookingShow(id,c,t){
      	var _this=this;
      	_this.chengeId=id;
        this.ajax(this.port.getbook, {table_id: id}, 'GET', function (res) {
          if (res.code == 1) {
            _this.bookLeaveMessage = res.data.notes;
            _this.bookUserName = res.data.username;
            _this.bookPhone = res.data.phone;
            _this.deskDteail.statrTime = res.data.arrive_time;
            _this.deskDteail.endTime = res.data.send_time;
            _this.deskDteail.cate_name = c;
            _this.deskDteail.table_name = t;
          }
        })
        this.bookingShowBtn=false;
        $('.deskno').removeClass('in');
        $('.bookview').addClass('in');
        $('.deskempty').removeClass('in');
      
      },
      //切换开单房间商品清单和合并订单状态
      changeStatic(id){
      	$('.price_tab span').eq(id).addClass('current').siblings('span').removeClass('current');
      	if(id==0){
          this.heDeskShow=false;
        }else{
          this.heDeskShow=true;
        }
      },
      //房间分类和房间联动
      changeClass(){
      	var _this=this;
      	this.ajax(this.port.goodsTurn,{type_id:this.zhuantaiClass},'GET',function (res) {
          if(res.code==1){
          	_this.zhuantaiList=res.data;
          }else{
          	_this.msgHint(res.msg);
          }
        })
      },
      //确认商品转台
      zhuantaiConfirm(){
      	if(this.zhuantaiClass==0){
      	 this.msgHint('请选择房间分类');
      	 return;
        }
        if(this.zhuantaiDesk==0){
      		this.msgHint('请选择台桌');
      		return ;
        }
        var _this=this;
        this.ajax(this.port.goodsTurn,{goods_id:this.openCancelId,table_id:this.zhuantaiDesk},'POST',function (res) {
          if(res.code==1){
            _this.zhuantaiList='';
            _this.zhuantaiDesk=0;
            _this.zhuantaiClass=0;
            _this.openCancelId='';
            _this.closeMask('.zhuantai');
            _this.ajax(_this.port.getorderone, {table_id: _this.deskDteail.deskId}, 'GET', function (res) {
              if (res.code == 1) {
                _this.openDataList = res.data;
                _this.getOpenOrder();
                _this.refresh();
              }
            })
          }else{
            _this.msgHint(res.msg);
          }
        })
      	
      },
      //房间转台
      changeDesk(){
        var _this=this;
        this.ajax(this.port.orderturn,{type_id:this.zhuantaiClass},'GET',function (res) {
          if(res.code==1){
            _this.zhuantaiList=res.data;
          }else{
            _this.msgHint(res.msg);
          }
        })
      },
      //确认房间转台
      changeDeskConfirm(){
        if(this.zhuantaiClass==0){
          this.msgHint('请选择房间分类');
          return;
        }
        if(this.zhuantaiDesk==0){
          this.msgHint('请选择台桌');
          return ;
        }
        var _this=this;
        this.ajax(this.port.orderturn,{table_id:_this.deskDteail.deskId,table_turn_id:this.zhuantaiDesk},'POST',function (res) {
          if(res.code==1){
            _this.zhuantaiList='';
            _this.zhuantaiDesk=0;
            _this.zhuantaiClass=0;
            _this.openCancelId='';
            _this.closeMask('.changeDeskcon');
            $('.deskno').removeClass('in');
                _this.refresh();
          }else{
            _this.msgHint(res.msg);
          }
        })
      },
      //合并房间
      heDesk(){
      	var _this=this;
      	this.changeMask('.heDesk');
      	this.ajax(this.port.ordermerge,{},'GET',function (res) {
      		if(res.code==1){
      		      _this.heDeskList=res.data.data;
          }
        })
      },
      //合并房间提交
      heConfirm(){
      	if(this.heDeskDataId.length==0){
      		this.msgHint('请选择要合并的台桌');
      		return;
        }
        var _this=this;
        this.ajax(this.port.ordermerge,{table_merge_id:this.heDeskDataId,table_id:this.deskDteail.deskId},'POST',function (res) {
          if(res.code==1){
            _this.heDeskDataId=[];
            _this.heDeskList=[];
            _this.refresh();
            _this.closeMask('.heDesk');
            $('.deskno').removeClass('in');
          }
        })
      },
      //吧台消费点单
      btOrderList(){
      	var _this=this;
      	_this.changeMask('.')
      },
      //结账
      orderPay(type){
      	var _this=this;
      	if(type=='order'){
          _this.accountsList=[];
          _this.accountsClassify=[];
          _this.order_type='';
          if(_this.openDataList['goods_list'].length==0){
            _this.order_type='goods';
            _this.accountsClassify.push({
              'order_type':'goods',
              'name':_this.openDataList['table_name']+"(￥"+_this.openDataList['table_amount']+")"
            });
            _this.accountsList.push({
              'order_type':'goods',
            	'table_name':_this.openDataList['table_name'],
              'price':_this.openDataList['table_amount'],
              'count':_this.openDataList['time'],
              'price_count':_this.openDataList['table_amount'],
              'time':_this.openDataList['start_time']
            })
          }else{
            _this.order_type='goods';
            _this.accountsClassify.push({
              'order_type':'goods',
              'name':_this.openDataList['table_name']+"(￥"+_this.openDataList['table_amount']+")"
            });
            for(let i=0;i<_this.openDataList['goods_list'].length;i++){
              _this.accountsList.push({
                'order_type':'goods',
                'table_name':_this.openDataList['goods_list'][i]['goods_name'],
                'price':_this.openDataList['goods_list'][i]['price'],
                'count':_this.openDataList['goods_list'][i]['num'],
                'price_count':_this.openDataList['goods_list'][i]['sum_price'],
                'time':_this.openDataList['goods_list'][i]['add_time']
              })
            }
          }
          if(_this.heGoodsList.length!=0){
          	for(let i=0;i<_this.heGoodsList.length;i++){
              _this.accountsClassify.push({
                'order_type':'he'+i,
                'name':_this.heGoodsList[i]['table_name']+"(￥"+_this.heGoodsList[i]['total_amount']+")"
              });
          		for(let j=0;j<_this.heGoodsList[i]['goods_list'].length;j++){
                _this.accountsList.push({
                	'order_type':'he'+i,
                  'table_name':_this.heGoodsList[i]['goods_list'][j]['goods_name'],
                  'price':_this.heGoodsList[i]['goods_list'][j]['price'],
                  'count':_this.heGoodsList[i]['goods_list'][j]['num'],
                  'price_count':_this.heGoodsList[i]['goods_list'][j]['sum_price'],
                  'time':_this.heGoodsList[i]['goods_list'][j]['add_time']
                })
              }
            }
          }
          _this.changeMask('.viewbillroom');
        }else{
      		if(_this.goodTotal.totalPrice==0 || _this.goodTotal.totalPrice==''){
            _this.closeMask('.counterview');
          }else{
      			_this.ajax(_this.port.btxf,{goodsList:_this.addGoodsList},'post',function (res) {
              if(res.code==1){
              	_this.btOrderId=res.data.order_id;
                _this.closeMask('.counterview');
                _this.changeMask('.viewbillroom_bt');
              }else{
                _this.msgHint(res.msg);
              }
            })
          }
        }
      },
      //结账查看更多
      changemores(){
      	this.changemore=!this.changemore;
      	if(this.changemore){
      		$('#order_list').css('height','100%');
      		$('#order_lists').css('height','100%');
        }else{
          $('#order_list').css('height','149px');
          $('#order_lists').css('height','149px');
        }
        
      },
      //结账选择支付方式
      changePayList(changeid){
      	this.eqpaylist=changeid;
      },
      changePayLists(changeid){
        this.eqpaylists=changeid;
      },
      //选择支付时价格联动
      changeOrderPay(type){
      	var _this=this;
      	switch (type){
          case 'cashpay':
          	if(!/^\d{1,20}$/.test(_this.cashpay.split('.')[0])){
          		_this.msgHint('请输入正确的数字');
          		_this.cashpay='';
              _this.orederTotalPrices=_this.orederTotalPrice-_this.getOtherPrivilege();
          		return;
            }
            _this.orederTotalPrices=_this.orederTotalPrice-_this.getOtherPrivilege();
          break;
          case 'alipay':
            if(!/^\d{1,20}$/.test(_this.alipay.split('.')[0])){
              _this.msgHint('请输入正确的数字');
              _this.alipay='';
              _this.orederTotalPrices=_this.orederTotalPrice-_this.getOtherPrivilege();
              return;
            }
            _this.orederTotalPrices=_this.orederTotalPrice-_this.getOtherPrivilege();
          break;
          case 'wxpay':
            if(!/^\d{1,20}$/.test(_this.wxpay.split('.')[0])){
              _this.msgHint('请输入正确的数字');
              _this.wxpay='';
              _this.orederTotalPrices=_this.orederTotalPrice-_this.getOtherPrivilege();
              return;
            }
            _this.orederTotalPrices=_this.orederTotalPrice-_this.getOtherPrivilege();
          break;
          case 'swiping_card':
            if(!/^\d{1,20}$/.test(_this.swiping_card.split('.')[0])){
              _this.msgHint('请输入正确的数字');
              _this.casswiping_cardhpay='';
              _this.orederTotalPrices=_this.orederTotalPrice-_this.getOtherPrivilege();
              return;
            }
            _this.orederTotalPrices=_this.orederTotalPrice-_this.getOtherPrivilege();
          break;
          case 'memberpay':
            if(!/^\d{1,20}$/.test(_this.memberpay.split('.')[0])){
              _this.msgHint('请输入正确的数字');
              _this.memberpay='';
              _this.orederTotalPrices=_this.orederTotalPrice-_this.getOtherPrivilege();
              return;
            }
            _this.orederTotalPrices=_this.orederTotalPrice-_this.getOtherPrivilege();
          break;
        }
      },
      //获取其他优惠
      getOtherPrivilege(){
      	var result=0;
        if(this.cashpay!=0 || this.cashpay!=''){
          result+=Number(this.cashpay);
        }
        if(this.swiping_card!=0 || this.swiping_card!=''){
          result+=Number(this.swiping_card);
        }
        if(this.wxpay!=0 || this.wxpay!=''){
          result+=Number(this.wxpay);
        }
        if(this.alipay!=0 || this.alipay!=''){
          result+=Number(this.alipay);
        }
        if(this.memberpay!=0 || this.memberpay!=''){
          result+=Number(this.memberpay);
        }
        if(this.privilegepay!=0 || this.privilegepay!=''){
          result+=Number(this.privilegepay);
        }
        return result;
      },
      //验证会员账号
      verifyPhone(){
      	var _this=this;
        if (!/^1(3[0-9]|4[57]|5[0-35-9]|7[013678]|8[0-9])[\d]{8}$/g.test(this.memberphone)) {
          this.msgHint('请填写正确手机号码');
          return ;
        }
      	this.ajax(this.port.member,{phone:this.memberphone},'get',function (res) {
          if(res.code==1){
            _this.memberData=[];
            _this.memberData=res.data;
            _this.memberShow=true;
            _this.eqpaylists=4;
          }else{
          	_this.msgHint(res.msg);
          }
        })
      	
      },
      //手动优惠
      privilege(){
     
        if(!/^\d{1,20}$/.test(this.privilegepay.split('.')[0])){
          this.orederTotalPrices=this.orederTotalPrice-this.getOtherPrivilege();
          this.privilegepay='';
          this.msgHint('请输入正确的数字');
          return;
        }
        if(this.youhuiList.length==0){
        	this.msgHint('没有相应的优惠');
          this.privilegepay='';
          this.orederTotalPrices=this.orederTotalPrice-this.getOtherPrivilege();
          return ;
        }else{
        	var result=0;
        	var arr=[];
        	for(let i=0;i<this.youhuiList.length;i++){
            arr.push(Number(this.youhuiList[i]['discount_money']));
        		if(Number(this.orederTotalPrice)>=Number(this.youhuiList[i]['min_money'])&&Number(this.orederTotalPrice)<=Number(this.youhuiList[i]['max_money'])){
              result=Number(this.youhuiList[i]['discount_money']);
            }else if(Number(this.orederTotalPrice)>Number(this.youhuiList[i]['max_money'])){
              result=Number(this.youhuiList[i]['discount_money']);
            }
          }
//          for(let j=0;j<this.youhuiList.length;j++){
//            if(Number(this.orederTotalPrice)>Number(this.youhuiList[j]['max_money'])){
//              result=Math.max.apply(this,arr);
//            }
//          }
          if(this.privilegepay>result){
            this.privilegepay=result;
            this.orederTotalPrices=this.orederTotalPrice-this.getOtherPrivilege();
            this.msgHint('超出了最大优惠金额');
            return;
          }
        }
        this.orederTotalPrices=this.orederTotalPrice-this.getOtherPrivilege();
        
      },
      //打印
      pr(){
        setTimeout(function(){
          $('#divCustomerRechargePrint').printArea();
        },500)
      },
      //预打印账单
      getReadyPrint(){
      	this.pr();
      },
      //免单
      exempt(){
      	var _this=this;
      	_this.is_exempt?_this.is_exempt=true:_this.is_exempt=false;
        if(_this.is_exempt){
        	_this.orederTotalPrices=0;
          _this.alipay='';//支付宝
          _this.wxpay='';//微信
          _this.memberpay='';//会员支付
          _this.privilegepay='';//优惠
          _this.swiping_card='';//刷卡
          _this.cashpay='';//现金
          _this.memberphone=='';//现金
        }else{
          _this.orederTotalPrices=_this.orederTotalPrice;
        }
      },
      //结账
      goToPay(type){
      	var _this=this;
      	var payType=[];
      	if(this.alipay== 0 || this.alipay==''){
      		payType.push({'ali_pay':{'status':0, 'ali_pay_num':0}})
        }else{
          payType.push({'ali_pay':{'status':1, 'ali_pay_num':this.alipay}})
        }
        if(this.wxpay== 0 || this.wxpay==''){
          payType.push({'wx_pay':{'status':0, 'wx_pay_num':0}})
        }else{
          payType.push({'wx_pay':{'status':1, 'wx_pay_num':this.wxpay}})
        }
        if(this.memberpay== 0 || this.memberpay==''){
          payType.push({'vip_pay':{'status':0, 'vip_pay_num':0}})
        }else{
          payType.push({'vip_pay':{'status':1, 'vip_pay_num':this.memberpay}})
        }
        if(this.privilegepay== 0 || this.privilegepay==''){
          payType.push({'preferential':{'status':0, 'preferential_num':0}})
        }else{
          payType.push({'preferential':{'status':1, 'preferential_num':this.privilegepay}})
        }
        if(this.swiping_card== 0 || this.swiping_card==''){
          payType.push({'card_pay':{'status':0, 'card_pay_num':0}})
        }else{
          payType.push({'card_pay':{'status':1, 'card_pay_num':this.swiping_card}})
        }
        if(this.cashpay== 0 || this.cashpay==''){
          payType.push({'money_pay':{'status':0, 'money_pay_num':0}})
        }else{
          payType.push({'money_pay':{'status':1, 'money_pay_num':this.cashpay}})
        }
        var exempt,data,url;
        if(this.is_exempt){
          exempt=1;
        }else{
          exempt=0;
        }
        if(type=='order'){
        	data={
            'table_id':this.deskDteail.deskId,
            'vip_phone':this.memberphone,
            'is_exempt':exempt,
            'pay':payType
          };
        	url=this.port.orderPay;
        }else{
        	data={
            'order_id':this.btOrderId,
            'vip_phone':this.memberphone,
            'is_exempt':exempt,
            'pay':payType
          };
        	url=this.port.paybtxf;
        }
      	this.ajax(url,data,'post',function (res) {
          if(res.code==1){
            if(_this.printShow){
              _this.pr();
            }
            _this.btOrderId='';
            _this.is_exempt=false;
            _this.closeMask('.viewbillroom');
            _this.closeMask('.viewbillroom_bt');
            _this.closeMask('.deskno');
            _this.refresh();
          }else{
          	_this.msgHint(res.msg);
          }
        })
      	
      },
      //预定
      booking(){
        //验证桌台名称是否为空
        if (this.bookUserName == '') {
          this.msgHint('请填写预订人姓名');
          return;
        }
        if (!/^1(3[0-9]|4[57]|5[0-35-9]|7[013678]|8[0-9])[\d]{8}$/g.test(this.bookPhone)) {
          this.msgHint('请填写正确手机号码');
          return;
        }
        var _this = this;
        const data = {
          table_id: this.deskDteail.deskId,
          arrive_time: this.deskDteail.statrTime,
          username: this.bookUserName,
          phone: this.bookPhone,
          notes: this.bookLeaveMessage,
          send_time: this.deskDteail.endTime,
          message: this.bookMessage
        }
        this.ajax(this.port.book, data, 'POST', function (res) {
          if (res.code == 1) {
            _this.refresh();
            _this.deskDteail = {
              deskId: '',
              cate_name: '',
              table_name: '',
              p_num: '',
              statrTime: '',
              endTime: ''
            }
            _this.bookUserName = '';
            _this.bookPhone = '';
            _this.bookLeaveMessage = '';
            _this.bookMessage = '';
            _this.closeMask('.bookmodel');
            $('.deskempty').removeClass('in');
          } else {
            _this.msgHint(res.msg);
          }
          ;
        })
      },
      //开单
      openOder(id){
        var _this = this;
        this.chengeId = id;
        if(this.staffId==0){
        	this.msgHint('请选择服务员');
        	return
        }
        const data = {
          table_id: id,
          start_time: this.deskDteail.statrTime,
          person: this.openNum,
          notes: this.openRemark,
          staff_id:this.staffId
        }
        var url;
        if (this.bookType) {
          url = this.port.beginBook
        } else {
          url = this.port.begin;
        }
        this.ajax(url, data, 'POST', function (res) {
          if (res.code == 1) {
            _this.refresh();
            _this.deskDteail = {
              deskId: '',
              cate_name: '',
              table_name: '',
              p_num: '',
              statrTime: '',
              endTime: ''
            }
            _this.bookUserName = '';
            _this.bookPhone = '';
            _this.bookLeaveMessage = '';
            _this.bookMessage = '';
            _this.openNum = 4;
            _this.openRemark = '';
            _this.closeMask('.openView');
            _this.closeMask('.deskempty');
            _this.bookType = '';
            _this.staffId=0;
          } else {
            _this.msgHint(res.msg);
          }
          ;
        })
      },
      //刷新数据
      refresh(){
        this.dataList = [];
        this.initData();
      },
      //添加桌台
      addDesk(type){
        //验证桌台名称是否为空
        if (this.deskname == '') {
          this.msgHint('请填写台桌名称');
          return;
        }
        if (this.deskpnum=='') {
          this.msgHint('请填可坐人数');
          return;
        }
        var url, data;
        if (type == 1) {
          url =this.port.edittable;
          data = {
            table_name: this.deskname,
            id: this.chengeId,
            people_num: this.deskpnum
          }
        } else {
          url = this.port.addtable;
          data = {
            table_name: this.deskname,
            type_id: this.chengeId,
            people_num: this.deskpnum
          }
        }
        var _this = this;
        this.ajax(url, data, 'POST', function (res) {
          if (res.code == 1) {
            _this.refresh();
            _this.deskname = '';
            _this.deskpnum = '';
            _this.chengeId = '';
            if (type == 1) {
              _this.closeMask('.editdeskshow');
            } else {
              _this.closeMask('.addDesk');
            }
          } else {
            _this.msgHint(res.msg);
          }
          ;
    
        })
      },
      //添加茶座分类
      addClassify(type){
        if (this.classifyname == '') {
          this.msgHint('输入茶座分类名称');
          return;
        }
        ;
        if (this.billingClassify == 1) {
          if (!/^(([1-9]{1})(\d){0,20})$/g.test(this.deskPrice.split('.')[0])) {
            this.msgHint('输入茶座价格');
            return;
          }
        } else if (this.billingClassify == 2) {
          if (!/^[1-9]{1,2}$/g.test(this.timeFrame)) {
            this.msgHint('输入时段');
            return;
          }
          if (!/^([1-9]{1})(\d){0,20}$/g.test(this.deskPrice.split('.')[0])) {
            this.msgHint('输入茶座价格');
            return;
          }
        } else {
          this.deskPrice = 0;
          this.timeFrame = 0;
        }
        var url, data;
        if (type == 1) {
          url = this.port.edittabletype;
          data = {
            id: this.chengeId,
            cate_name: this.classifyname,//分类名称
            type: this.billingClassify,//计费类型
            price: this.deskPrice,//价格
            hour: this.timeFrame,//小时
            classification: this.deskClassify//散座，包厢
          }
        } else {
          url =this.port.addtabletype;
          data = {
            cate_name: this.classifyname,//分类名称
            type: this.billingClassify,//计费类型
            price: this.deskPrice,//价格
            hour: this.timeFrame,//小时
            classification: this.deskClassify//散座，包厢
          }
        }
        var _this = this;
        this.ajax(url, data, 'POST', function (res) {
          if (res.code == 1) {
            _this.refresh();
            _this.chengeId = '';
            _this.classifyname = '';
            _this.billingClassify = 1;
            _this.deskPrice = '';
            _this.deskClassify = 0;
            _this.timeFrame = '';
            if (type == 1) {
              _this.closeMask('.editdeskclassify');
            } else {
              _this.closeMask('.adddeskclassify');
            }
          } else {
            _this.msgHint(res.msg);
          }
          ;
        })
  
      },
      //关闭弹窗
      closeMask(ele){
      	this.heDeskDataId=[];
        $(ele).removeClass('in');
        $('.bgblack').removeClass('in');
        this.alipay='';//支付宝
        this.wxpay='';//微信
        this.memberpay='';//会员支付
        this.privilegepay='';//优惠
        this.swiping_card='';//刷卡
        this.cashpay='';//现金
        this.memberphone=='';//现金
        this.changemore=false;
      },
      //弹出弹窗
      changeMask(changeele, id){
        if (id) {
          this.chengeId = id;
        }
        $(changeele).addClass('in');
        $('.bgblack').addClass('in');
      },
      //预定开单
      openBookMask(changeele, type){
        this.bookType = type;
        $(changeele).addClass('in');
        $('.bgblack').addClass('in');
      },
      //删除二次确认
      deleteMask(changeele, id, str, type){
        this.deleteType = type;
        this.chengeId = id;
        this.deleteDeskName = str;
        $(changeele).addClass('in');
        $('.bgblack').addClass('in');
        this.changeMask('.confirmshow');
      },
      cancelMake(changeele, id){
        this.chengeId = id;
        $(changeele).addClass('in');
        $('.bgblack').addClass('in');
      },
      //编辑茶座
      editDeskMask(changeele, id, name, num){
        this.deskname = name;
        this.deskpnum = num;
        this.chengeId = id;
        $(changeele).addClass('in');
        $('.bgblack').addClass('in');
      },
      //编辑茶座分类
      editClassify(changeele, id, name, hour, price, type, classification_name){
        this.chengeId = id;
        this.classifyname = name;
        this.billingClassify = type;
        this.deskPrice = price;
        if (classification_name == '散座') {
          this.deskClassify = 0;
        } else {
          this.deskClassify = 1;
        }
        this.timeFrame = hour;
        $(changeele).addClass('in');
        $('.bgblack').addClass('in');
      },
      //二次确认取消预定
      rBookConfirm(){
        var _this = this;
        this.ajax(this.port.closebook, {table_id: _this.chengeId}, 'POST', function (res) {
          if (res.code == 1) {
            _this.refresh();
            _this.chengeId = '';
            _this.closeMask('.bookconfirmshow');
            $('.bookview').removeClass('in');
          } else {
            _this.msgHint(res.msg);
          }
        });
      },
      //二次确认点击确认执行操作
      deleteConfirm(){
        var _this = this;
        var url;
        if (this.deleteType == 'desk') {
          url = this.port.deltable;
        } else if (this.deleteType == 'classify') {
          url = this.port.deltabletype;
        }
        this.ajax(url, {id: _this.chengeId}, 'POST', function (res) {
          if (res.code == 1) {
            _this.refresh();
            _this.chengeId = '';
            _this.deleteType = '';
            _this.closeMask('.confirmshow');
          } else {
            _this.msgHint(res.msg);
          }
        });
      },
      //茶座编辑
      editDesk(){
        //验证桌台名称是否为空
        if (this.deskname == '') {
          this.msgHint('请填写台桌名称');
          return;
        }
        if (!/^[1-9]{1,2}$/g.test(this.deskpnum)) {
          this.msgHint('请填写正确的人数');
          return;
        }
        var _this = this;
        this.ajax(this.port.edittable, {
          table_name: this.deskname,
          id: this.chengeId,
          people_num: this.deskpnum
        }, 'POST', function (res) {
          if (res.code == 1) {
            _this.refresh();
            _this.deskname = '';
            _this.deskpnum = '';
            _this.closeMask('.editdeskshow');
          } else {
            _this.msgHint(res.msg);
          }
          ;
        })
      },
      //时间插件
      selectDate(elem){
        var _this = this;
        laydate({
          elem: elem,
          istime: true,
          istoday: false,
          isclear:false,
          format: 'YYYY-MM-DD hh:mm',
          choose: function (dates) { //选择好日期的回调
            if (elem != '#txtBusinessBookCancelTime') {
              var myDate = _this.initDate(dates);
              _this.deskDteail.statrTime = myDate.statrTime;
              _this.deskDteail.endTime = myDate.endTime;
              _this.bookMessage = '恭喜，您已成功预订：小张（' + _this.deskDteail.cate_name + '，' + _this.deskDteail.table_name + '），预订到店时间：' + myDate.statrTime + '，祝您消费愉快！'
            }
      
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
          startTime += Y + '-';
          (M < 10) ? startTime += "0" + M + '-' : startTime += M + '-';
          (D < 10) ? startTime += "0" + D + ' ' : startTime += D + ' ';
          (H < 10) ? startTime += "0" + H + ':' : startTime += H + ':';
          (I < 10) ? startTime += "0" + I : startTime += I;
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
        endTime += Y + '-';
        (M < 10) ? endTime += "0" + M + '-' : endTime += M + '-';
        (D < 10) ? endTime += "0" + D + ' ' : endTime += D + ' ';
        (H < 10) ? endTime += "0" + H + ':' : endTime += H + ':';
        (I < 10) ? endTime += "0" + I : endTime += I;
        return endTime;
      },
      //删除
      deskDel(){
        $('.bench_entry .blk-gray .title').hover(function () {
          $(this).children('.deskdelete').stop(true).show();
        }, function () {
          $(this).children('.deskdelete').stop(true).hide();
        })
        $('.bench_entry .blk-gray .deskdelete ').click(function () {
          return false;
        });
        $('.bench_entry .blk-gray .deskdelete a').click(function () {
      
          return false
        })
        $('.ding').click(function () {
          return false;
        })
    
      },
      //切换状态
      stateChange(typeid, name){
        var _this = this;
        $('#downlist').removeClass('in');
        this.typeId = typeid;
        this.stateName = name;
        this.ajax(this.port.gettable, {type: this.typeId}, "GET", function (res) {
          _this.dataList = res;
          for(var i=0;i<res.data.length;i++){
            var count=0;
            for(var j=0;j<res.data[i]['tables'].length;j++){
              count+=Number(res.data[i]['tables'][j]['use_type']);
            }
            _this.dataList['data'][i].countShow=count;
          }
        
        })
      },
      //初始化吧台，商品数据
      getGoosDataList(page){
        var _this = this;
       
        this.ajax(this.port.initlist, {page: page}, 'GET', function (res) {
          if (res.code == 1) {
          
            _this.goodsPageList = [];
            _this.goosDataList = res.data;
            _this.categoryList = res.data['list']['category'];
            _this.goodsList = res.data['list']['goods'];
            for (var i = 1; i <= res.data['pageNum']; i++) {
              _this.goodsPageList.push(i);
            }
          } else {
            _this.msgHint(res.msg);
          }
        });
      },
      //获取搜索商品数据
      getSearchData(page){
        var _this = this;
        _this.page = page;
        _this.ajax(this.port.search, {
          page: page,
          keyword: _this.keyWords,
          cate_id: _this.goodsClass
        }, 'GET', function (res) {
          if (res.code == 1) {
            _this.goodsPageList = [];
            _this.goosDataList = res.data;
            _this.categoryList = res.data['list']['category'];
            _this.goodsList = res.data['list']['goods'];
            for (var i = 1; i <= res.data['pageNum']; i++) {
              _this.goodsPageList.push(i);
            }
          } else {
            _this.msgHint(res.msg);
          }
        })
      },
      //吧台消费
      counter(changeele, page){
        this.page = page;
        this.getGoosDataList(page);
        this.addGoodsList = [];
        this.getTotalPrice();
        $(changeele).addClass('in');
        $('.bgblack').addClass('in');
      },
      //增加消费
      addOrder(changeele, page){
        this.page = page;
        this.getGoosDataList(page);
        this.addGoodsList = [];
        this.getTotalPrice();
        $(changeele).addClass('in');
        $('.bgblack').addClass('in');
      },
      //确认增加消费
      confirmOrder(){
        var _this = this;
        //this.addGoodsList);
        this.ajax(this.port.addgoods, {
          goodsList: this.addGoodsList,
          table_id: this.deskDteail.deskId
        }, 'POST', function (res) {
          if (res.code == 1) {
            _this.ajax(_this.port.getorderone, {table_id: _this.deskDteail.deskId}, 'GET', function (res) {
              if (res.code == 1) {
                _this.openDataList = res.data;
                _this.getOpenOrder();
                _this.refresh();
              }
            })
            _this.closeMask('.orderview')
  
          }
        })
  
      },
      //消费商品转台
      openGoodsTurn(id,name){
        this.openCancelId=id;
        this.openCancelName=name;
        $('.zhuantai').addClass('in');
        $('.bgblack').addClass('in');
      },
      //消费商品取消
      openGoodsconfirmshow(id,parentid){
        this.openCancelId=id;
        this.openCancelParentId=parentid;
        
        $('.openGoodsconfirmshow').addClass('in');
        $('.bgblack').addClass('in');
      },
      //商品删除二次确认
      openGoodsCancelConfirm(){
        var _this=this;
        this.ajax(this.port.goodsCancel,{order_goods_id:this.openCancelId,order_id:this.openCancelParentId},'POST',function (res) {
          if(res.code==1){
            _this.ajax(_this.port.getorderone, {table_id: _this.deskDteail.deskId}, 'GET', function (res) {
              if (res.code == 1) {
                _this.openDataList = res.data;
                _this.openCancelId='';
                _this.getOpenOrder();
                _this.refresh();
                $('.openGoodsconfirmshow').removeClass('in');
                $('.bgblack').removeClass('in');
              }
            })
          }
        })
      },
      //开单桌台商品转配
      givePei(id,pid){
        this.openCancelId=id;
        this.openCancelParentId=pid;
        $('.openGivePeiconfirmshow').addClass('in');
        $('.bgblack').addClass('in');
      },
      //转配二次确认
      openGivePeiConfirm(){
        var _this=this;
        this.ajax(this.port.goodsGiv,{order_goods_id:this.openCancelId,order_id:this.openCancelParentId},'POST',function (res) {
          if(res.code==1){
            _this.ajax(_this.port.getorderone, {table_id: _this.deskDteail.deskId}, 'GET', function (res) {
              if (res.code == 1) {
                _this.openDataList = res.data;
                _this.openCancelId='';
                _this.getOpenOrder();
                _this.refresh();
                $('.openGivePeiconfirmshow').removeClass('in');
                $('.bgblack').removeClass('in');
              }
            })
          }
        })
      },
      //分页
      changePage(page, type){
        if (type) {
          if (type == 'prev') {
            if (page > 1) {
              page--;
              this.page = page;
              if (this.pageIsSearch) {
                this.getSearchData(page)
              } else {
                this.getGoosDataList(page);
              }
            }else{
            	return
            }
          } else {
            if (page < this.goosDataList['pageNum']){
              page++;
              this.page = page;
            }else{
            	return
            }
            if (this.pageIsSearch) {
              this.getSearchData(page)
            } else {
              this.getGoosDataList(page);
            }
          }
        } else {
          this.page = page;
          if (this.pageIsSearch) {
            this.getSearchData(page)
          } else {
            this.getGoosDataList(page);
          }
        }
      },
      //添加购买商品
      addgoodss(id){
        if (this.addGoodsList.length == 0) {
          for (var i = 0; i < this.goodsList.length; i++) {
            if (this.goodsList[i]['id'] == id) {
              this.goodsList[i]['count'] = 1;
              this.goodsList[i]['add_time'] = this.getDate();
              this.addGoodsList.push(this.goodsList[i]);
            }
          }
        } else {
          for (var j = 0; j < this.addGoodsList.length; j++) {
            if (this.addGoodsList[j]['id'] == id) {
              var count = parseInt(this.addGoodsList[j]['count']);
              if(this.addGoodsList[j]['stock']!='-'){
                var store = parseInt(this.addGoodsList[j]['stock']);
                if (count < store) {
                  count += 1;
                  this.addGoodsList[j]['count'] = count
                  this.addGoodsList.splice(j, 1, this.addGoodsList[j]);
                } else {
                  this.msgHint('数量不能超过库存数量');
                }
              }else{
                count += 1;
                this.addGoodsList[j]['count'] = count
                this.addGoodsList.splice(j, 1, this.addGoodsList[j]);
              }
              
            } else {
              if (this.getindex(id)) {
                for (var ii = 0; ii < this.goodsList.length; ii++) {
                  if (this.goodsList[ii]['id'] == id) {
                    this.goodsList[ii]['count'] = 0;
                    this.goodsList[ii]['add_time'] = this.getDate();
                    this.addGoodsList.push(this.goodsList[ii]);
                  }
                }
              }
            }
          }
        }
        //计算总价
        this.getTotalPrice();
      },
      //删除选中的商品
      removeGoods(id){
        for (var j = 0; j < this.addGoodsList.length; j++) {
          if (this.addGoodsList[j]['id'] == id) {
            //this.addGoodsList[j]['count']=0;
            this.addGoodsList.splice(j, 1);
          }
        }
        this.getTotalPrice();
      },
      //更改选中数量
      changecount(id, type){
        if (type == 'prev') {
          for (var j = 0; j < this.addGoodsList.length; j++) {
            if (this.addGoodsList[j]['id'] == id) {
              var count = parseInt(this.addGoodsList[j]['count']);
              if (count) {
                count -= 1;
                this.addGoodsList[j]['count'] = count;
                this.addGoodsList.splice(j, 1, this.addGoodsList[j]);
              }
            }
          }
        } else {
          for (var j = 0; j < this.addGoodsList.length; j++) {
            if (this.addGoodsList[j]['id'] == id) {
              var count = parseInt(this.addGoodsList[j]['count']);
              if(this.addGoodsList[j]['stock']!='-'){
                var store = parseInt(this.addGoodsList[j]['stock']);
                if (count < store) {
                  count += 1;
                  this.addGoodsList[j]['count'] = count
                  this.addGoodsList.splice(j, 1, this.addGoodsList[j]);
                } else {
                  this.msgHint('数量不能超过库存数量');
                }
              }else{
                count += 1;
                this.addGoodsList[j]['count'] = count
                this.addGoodsList.splice(j, 1, this.addGoodsList[j]);
              }
             
            }
          }
        }
        this.getTotalPrice();
      },
      //判断列表中是否有重复数据
      getindex(id){
        var arr = [];
        var result = false;
        for (var j = 0; j < this.addGoodsList.length; j++) {
          if (this.addGoodsList[j]['id'] == id) {
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
      //
      getTotalPrice(){
        var totalPrice = 0;
        var count = 0;
        for (var i = 0; i < this.addGoodsList.length; i++) {
          var counts = parseInt(this.addGoodsList[i]['count']);
          var store = parseInt(this.addGoodsList[i]['stock']);
          if(/^[1-9]{1}\d{0,10}$/.test(counts)){
            if (counts > store) {
              this.msgHint('数量不能超过库存数量');
              this.addGoodsList[i]['count'] = this.addGoodsList[i]['stock'];
              count += parseInt(this.addGoodsList[i]['count']);
              totalPrice += (this.addGoodsList[i]['count'] * this.addGoodsList[i]['sales_price']);
            } else if (this.addGoodsList[i]['count'] == '') {
              this.addGoodsList[i]['count'] = 1;
              count += parseInt(this.addGoodsList[i]['count']);
              totalPrice += (this.addGoodsList[i]['count'] * this.addGoodsList[i]['sales_price']);
            } else {
              count += parseInt(this.addGoodsList[i]['count']);
              totalPrice += (this.addGoodsList[i]['count'] * this.addGoodsList[i]['sales_price']);
            }
          }else{
            this.addGoodsList[i]['count'] = 1;
            count += parseInt(this.addGoodsList[i]['count']);
            totalPrice += (this.addGoodsList[i]['count'] * this.addGoodsList[i]['sales_price']);
          }
          
        }
        this.goodTotal = {
          count: count,
          totalPrice: totalPrice
        }
        this.orederTotalPrice=totalPrice;
        this.orederTotalPrices=totalPrice;
      },
      //开单消费商品价格计算
      getOpenOrder(){
        var result = 0;
        var count = 0;
        var hePrice=0;
        for (var i = 0; i < this.openDataList['goods_list'].length; i++) {
          count += parseInt(this.openDataList['goods_list'][i]['num']);
          result += parseInt(this.openDataList['goods_list'][i]['sum_price']);
        }
        
        if(this.heGoodsList.length!=0){
          for (var j = 0; j< this.heGoodsList.length; j++) {
            hePrice+=parseInt(this.heGoodsList[j]['total_amount']);
          }
        }else{
            hePrice=0;
        }
      // total_amount
        this.orderGoodTotal = {
          ordertotalPrice: result,
          count: count,
          totalPrice: (result+this.openDataList['table_amount']+hePrice)-this.cdbNum,
          hePrice:hePrice
        }
        this.orederTotalPrice=(result+this.openDataList['table_amount']+hePrice)-this.cdbNum;
        this.orederTotalPrices=this.orederTotalPrice;
      },
      //搜索
      search(){
        var _this = this;
        var page = 1;
        if (this.goodsClass == 0) {
          this.pageIsSearch = false;
          this.getGoosDataList(page);
        } else {
          _this.pageIsSearch = true;
          setTimeout(function () {
            _this.getSearchData(page);
          }, 1000);
        }
      },
      //初始化数据
      initData(){
        //type 0(全部),1(使用中),2(预订),3(空闲)
        var _this = this;
        this.ajax(this.port.gettable, {type: _this.typeId}, "GET", function (res) {
        	if(res.code==1){
            _this.dataList = res;
            for(var i=0;i<res.data.length;i++){
              var count=0;
              for(var j=0;j<res.data[i]['tables'].length;j++){
                count+=parseInt(res.data[i]['tables'][j]['use_type']);
              }
              _this.dataList['data'][i].countShow=count;
            }
          }
          
        })
        this.ajax(this.port.begin,{},'get',function (res) {
          if(res.code==1){
            _this.staffList=[];
          	_this.staffList=res.data;
          }
        })
      },
      //初始化优惠列表
      youhuiInit(){
      	var _this=this;
        this.ajax(this.port.discount,{},'get',function (res) {
          if(res.code==1){
          	_this.youhuiList=[];
          	_this.youhuiList=res.data;
          }
        })
      },
      //轮询
      pollData(){
        var _this = this;
        this.ajax(this.port.gettable, {type: _this.typeId}, "GET", function (res) {
        	if(res.code==1){
            _this.dataList = res;
            for(var i=0;i<res.data.length;i++){
              var count=0;
              for(var j=0;j<res.data[i]['tables'].length;j++){
                count+=parseInt(res.data[i]['tables'][j]['use_type']);
              }
              _this.dataList['data'][i].countShow=count;
            }
          }
          
        },false)
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
        result += Y + '-';
          (M < 10) ? result += "0" + M + '-' : result += M + '-';
          (D < 10) ? result += "0" + D + ' ' : result += D + ' ';
          (H < 10) ? result += "0" + H + ':' : result += H + ':';
          (I < 10) ? result += "0" + I +':'  : result += I + ':';
          result+='00';
        return result;
      }
    },
    //获取vuex数据集合
    computed:mapGetters(['getInit']),
    
    //组件渲染完成时执行的流程
    mounted(){
      //初始化数据
      var _this = this;
  	 //由于数据请求的异步性，设置定时器延迟获取vuex数据。
     setTimeout(function () {
       _this.role =_this.getInit['roleData']['business'];
     },800)
     
      var str = window.location.href;
      if(str.indexOf('business')!=-1){
        $('#navstr').html('营业');
      }
      this.initData();
      this.getGoosDataList(1);
      this.youhuiInit();
     
      
      _this.timer=setInterval(function () {
       _this.pollData();
      },30000)
    },
    updated(){//组件更新之后
      //鼠标移入状态改变
      var _this=this;
      $('#static').hover(function () {
        $('#downlist').addClass('in');
      }, function () {
        $('#downlist').removeClass('in');
      });
      //切换
      $(".chageclass").click(function () {
        
        var index = $(this).index();
        if (_this.typeId != 0) {
          _this.typeId = 0;
          _this.stateName = '全部状态';
          _this.refresh();
        }
        $(this).addClass('current').siblings('.chageclass').removeClass('current');
        $('.businesslist .bench_entry').each(function () {
          if (index == 1) {
            if ($(this).hasClass('sanzuo')) {
          
              $(this).removeClass('display-none');
            } else {
              $(this).addClass('display-none');
            }
          } else if (index == 2) {
            if ($(this).hasClass('baojian')) {
              $(this).removeClass('display-none');
            } else {
              $(this).addClass('display-none');
            }
          } else {
            $(this).removeClass('display-none');
          }
        })
      });
      this.deskDel();
      $('.classifyshow').hover(function () {
        $(this).find('a').stop(true).show(100);
      }, function () {
        $(this).find('a').stop(true).hide(100);
      })
     $('.changehelist').click(function(){
       $(this).toggleClass('current');
       $(this).siblings('.changehelist').removeClass('current');
     })
    },
    destroyed(){
    	clearInterval(this.timer);
    }
  }
</script>
<style scoped>
  #order_list{
    overflow: hidden;
    height: 149px;
  }
</style>
