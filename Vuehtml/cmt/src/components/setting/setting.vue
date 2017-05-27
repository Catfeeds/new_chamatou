<template>
  <div>
    <div class="contview">
      <!--导航-->
      <div class="contviewtab">
        <a href="javascript:void(0);" class="changecnav current" @click="navclick('0')" id="nav">全部</a>
        <a href="javascript:void(0);" class="changecnav" @click="navclick('1')" >商品</a>
        <a href="javascript:void(0);" class="changecnav" @click="navclick('2')" >单位</a>
        <a href="javascript:void(0);" class="changecnav" @click="navclick('3')" >原料</a>
        <a href="javascript:void(0);" class="changecnav" @click="navclick('4')" >角色</a>
        <a href="javascript:void(0);" class="changecnav" @click="navclick('5')" >员工</a>
        <a href="javascript:void(0);" class="changecnav" @click="navclick('6')" >其他</a>
        <div class="cvtab_button fr">
          <a style="display: none" class="btngreen r3px smallbtn smallxinzeng fr " href="javascript:void(0)" @click="popup('addStores','1')">新增门店</a>
          <a style="display: none" class="btngreen r3px smallbtn shopinfobtn fr" href="javascript:void(0)" @click="popup('Stores')">本店信息</a>
        </div>
      </div>
      <!--导航/end-->
      <!--全部-->
      <div class="settings bench white-scroll" style="display: block;" id="globaltable">
        <div>
<!-------------------------------------------商品分类------------------------------------------------------------->
          <dl class="clearfix settdl" v-if="role.goods_config">
            <dt class="fl">商品分类</dt>
            <dd class="fl r5px"   v-for="(goods,index) in goodsClassifyList">
              <i v-if="goods.goods_num==0" class="delete"  @click="popup('confirm',1,goods.id,'商品分类','goodsclassify')">删除</i>
              <a href="javascript:void(0);" @click="goodsclassifyDetail(goods.id,goods.cate_name)">
                <div class="text"> {{goods.cate_name}}</div>
                <div class="instt" v-if="goods.goods_num !=0">{{goods.goods_num}}种商品</div>
                <div class="instt" v-if="goods.goods_num==0">无商品</div>
              </a>
            </dd>
            <dd class="fl r5px plus"><a href="javascript:void(0);" @click="popup('addGoodsClassify',1)">+</a></dd>
          </dl>
<!-------------------------------------------单位设置------------------------------------------------------------->
          <dl class="clearfix settdl" v-if="role.unit_config">
            <dt class="fl">单位</dt>
            <dd class="fl r5px" v-for="(unitItem,index) in unitList">
              <i class="delete" @click="popup('confirm',1,unitItem.id,'计量单位','unit')">删除</i>
              <a href="javascript:void(0);"  @click="getUnitDetil(unitItem.id,unitItem.name)">{{unitItem.name}}</a>
            </dd>
           <dd class="fl r5px plus" @click="popup('unit',1);"><a href="javascript:void(0);">+</a></dd>
          </dl>
<!-------------------------------------------原料设置------------------------------------------------------------->
          <dl class="clearfix settdl" v-if="role.dosing_config">
            <dt class="fl">原料</dt>
            <dd class="fl r5px" v-for="(Item,index) in doSingList">
              <i class="delete" @click="popup('confirm',1,Item.id,'该原料','dosing')">删除</i>
              <a href="javascript:void(0);"  @click="getdosingDetil(Item.id,Item.name,Item.stock_warning,Item.number,Item.unit)">{{Item.name}}</a>
            </dd>
            <dd class="fl r5px plus" @click="popup('adddosing',1)"><a href="javascript:void(0);">+</a></dd>
          </dl>
          <!--原料分类详情/end-->
<!-------------------------------------------角色设置------------------------------------------------------------->
          <dl class="clearfix settdl" v-if="role.role_index">
            <dt class="fl">角色及权限</dt>
            <dd class="fl r5px" v-for="(rolelitss,index) in roleList" >
              <i v-if="rolelitss!='超级管理员'" class="delete" @click="popup('confirm',1,rolelitss,'角色','role')">删除</i>
              <a href="javascript:void(0);" @click="roleDetail(rolelitss)">{{rolelitss}}</a>
            </dd>
            
            <dd class="fl r5px plus" @click="popup('addrole',1)"><a href="javascript:void(0);">+</a></dd>
          </dl>
<!-------------------------------------------员工设置------------------------------------------------------------->
          <dl class="clearfix settdl" v-if="role.users_config">
            <dt class="fl">员工</dt>
            <dd class="fl r5px" v-for="(staffs,index) in staffList">
              <i v-if="staffs.is_admin!=1" class="delete" @click="popup('confirm',1,staffs.id,'该员工','staff')">删除</i>
              <a href="javascript:void(0);" @click="staffDetail(staffs.id)"><div class="text">{{staffs.user}}</div><div class="instt">{{staffs.role_name}}</div></a>
            </dd>
            <dd class="fl r5px plus"><a href="javascript:void(0);"  @click="popup('addUser',1)">+</a></dd>
          </dl>
         
<!-------------------------------------------其他设置------------------------------------------------------------->
          <dl class="clearfix settdl">
            <dt class="fl">其他设置</dt>
            <dd class="fl r5px" v-if="role.discount_config"><a href="javascript:void(0);" @click="popup('privilege',0)">手动优惠幅度设置</a></dd>
            <dd class="fl r5px" @click="popup('handworkView',1)" v-if="role.jiaoban_index"><a href="javascript:void(0);">交班预留现金配置</a></dd>
            <dd class="fl r5px" @click="popup('qrcode',1)" v-if="role.qrcode_store"><a href="javascript:void(0);">生成二维码</a></dd>
          </dl>
        </div>
      </div>
      <!--全部/end-->
    </div>
<!--弹出框列表-->
    <!--增加角色-->
    <div id="addrole" class=" thin-scroll  r10px ">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">新增角色</span>
          <a class="close fr" @click="close('addrole')" href="javascript:void(0)"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail">
          <div class="jurisdiction">
            <div class="jdt_input">
              <span>角色名称：</span>
              <input type="text" class="ng-untouched ng-pristine ng-invalid" v-model="roleName"/>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" class="jdt_conts">
              <tbody>
              <tr>
                <td class="conts_nav" valign="top">
                  <dl class="flex">
                      <dd class="flex-1" v-for="(rbac,index) in roleInitData">
                        <a href="javascript:void(0)" class="rbacindex"  :class="{'current':index==0}" @click="changeRbacList(index)">{{rbac.name}}</a>
                      </dd>
                    </dd>
                  </dl>
                </td>
              </tr>
              <tr>
                <td class="conts_navtwo">
                  <div>
                    <ul class="clearfix">
                      <li class="rbacdetail" v-for="(rbaclists,index) in rbacList" @click="changeRbacDetail(index)">
                        <a href="javascript:void(0)" :class="{'current':index==0}">
                          <input type="checkbox" @click="selectAll(rbaclists.name,index)" v-model='rbaclistaction' :value="rbaclists.name" class="ng-untouched ng-pristine ng-valid">
                          {{rbaclists.name}}
                        </a>
                      </li>
                    </ul>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="conts_list" valign="top">
                  <span v-for="(rbacdtetail,index) in rbacDetailList">
                    <label>
                      <input type="checkbox" @click="selectrole(rbacListIndex)" v-model="roleUrl"  :value="rbacdtetail.value"  class="ng-untouched ng-pristine ng-valid">
                      {{rbacdtetail.name}}
                    </label>
                  </span>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
          <div class="form_btn">
            <a class="btngreen baocun" href="javascript:void(0)" @click="addRbac('add')">保存</a>
          </div>
        </div>
      </div>
    </div>
    <!--修改角色-->
    <div id="editrole" class=" thin-scroll  r10px ">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl"> 修改角色</span>
          <a class="close fr" @click="close('editrole')" href="javascript:void(0)"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail">
          <div class="jurisdiction">
            <div class="jdt_input">
              <span>角色名称：</span>
              <input type="text" class="ng-untouched ng-pristine ng-invalid" :value="roleName" readonly="readonly"/>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" class="jdt_conts">
              <tbody>
              <tr>
                <td class="conts_nav" valign="top">
                  <dl class="flex">
                    <dd class="flex-1" v-for="(rbac,index) in roleInitData">
                      <a href="javascript:void(0)" class="rbacindex rbacindexedit"  :class="{'current':index==0}" @click="changeRbacList(index)">{{rbac.name}}</a>
                    </dd>
                    </dd>
                  </dl>
                </td>
              </tr>
              <tr>
                <td class="conts_navtwo">
                  <div>
                    <ul class="clearfix">
                      <li class="rbacdetail rbacdetailedit" v-for="(rbaclists,index) in rbacList" @click="changeRbacDetail(index)">
                        <a href="javascript:void(0)" :class="{'current':index==0}">
                          <input type="checkbox" @click="selectAll(rbaclists.name,index)" v-model='rbaclistaction' :value="rbaclists.name" class="ng-untouched ng-pristine ng-valid">
                          {{rbaclists.name}}
                        </a>
                      </li>
                    </ul>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="conts_list" valign="top">
                  <span v-for="(rbacdtetail,index) in rbacDetailList">
                    <label>
                      <input type="checkbox" @click="selectrole(rbacListIndex)" v-model="roleUrl"  :value="rbacdtetail.value"  class="ng-untouched ng-pristine ng-valid">
                      {{rbacdtetail.name}}
                    </label>
                  </span>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
          <div class="form_btn">
            <a class="btngreen baocun" href="javascript:void(0)" @click="addRbac('edit')">保存</a>
          </div>
        </div>
      </div>
    </div>
    <!--角色详情-->
    <div id="roleinfo" class="drawerdetail  flex flex-v ">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">角色详细信息</span>
          <a class="close fr" href="javascript:void(0);" @click="close('roleinfo')"></a>
        </div>
        <div class="theinfo" style="border: none">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>角色名称：{{roleNames}}</td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            </tbody>
          </table>
            <div class="tb1" >
              <div class="fl " id="tab1">
              </div>
              <div class="fl " id="tab2" >
              </div>
              <div class="fl tb4" id="tab3">
              </div>
            </div>
        </div>
      </div>
      <div class="dwdtl_btn">
        <a class="btngreen fr xinzeng" href="javascript:void(0)"  @click="popup('addrole',1)">新增角色</a>
        <a v-if="roleNames!='超级管理员'"  class="roominfo sidelink fr" href="javascript:void(0)" @click="popup('editrole',1)">修改角色</a>
        <div class="clear"></div>
      </div>
    </div>
    <!--角色详情/end-->
    <!--单位详情-->
    <div class="drawerdetail flex flex-v " id="unitdetail">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">计量单位详细信息</span>
          <a class="close fr" @click="close('unitdetail');" href="javascript:void(0);"></a>
        </div>
        <div class="theinfo">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>单位名称：</td>
              <td>{{unitDetail.name}}</td>
              <td>创建时间：</td>
              <td>{{unitDetail.time}}</td>
            </tr>
           
            </tbody></table>
        </div>
        <div class="theinfo_tbl">
        </div>
      </div>
      <div class="dwdtl_btn">
        <a class="btngreen fr xinzeng" href="javascript:void(0)" @click="popup('unit',1);">新增单位</a>
        <a class="roominfo sidelink fr" href="javascript:void(0)" @click="popup('editUnit',1)">修改单位</a>
        <div class="clear"></div>
      </div>
    </div>
    <!--修改单位-->
    <div class="viewsmall form_cont r10px " id="editUnit">
      <div class="form_cap clearfix">
        <span class="fl">修改计量单位</span>
        <a class="close fr" @click="close('editUnit')" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>名称：</td>
              <td><input autofocus="true" placeholder="请输入计量单位名称"  v-model="unitName" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            </tbody></table>
        </div>
        <div class="form_prompt">用于商品、原材料的计量单位。</div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);" @click="addUnit('edit')">保存</a>
        </div>
      </div>
    </div>
    <!--增加单位-->
    <div class="viewsmall form_cont r10px " id="unit">
      <div class="form_cap clearfix">
        <span class="fl">增加计量单位</span>
        <a class="close fr" @click="close('unit')" href="javascript:void(0);"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>名称：</td>
              <td><input autofocus="true" placeholder="请输入计量单位名称" v-model="unitName" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            </tbody></table>
        </div>
        <div class="form_prompt">用于商品、原材料的计量单位。</div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);" @click="addUnit('add')">保存</a>
        </div>
      </div>
    </div>
    <!--显示二维码-->
    <div class="viewsmall form_cont r10px " style="width: 500px;" id="qrcode">
      <div class="form_cap clearfix">
        <span class="fl">店铺二维码</span>
        <a class="close fr" @click="close('qrcode')" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <div class="form_table" style="text-align: center">
         <img :src="qrcodeUrl" style="width: 300px;height: 300px;"/>
        </div>
        
      </div>
    </div>
    <!--添加原料-->
    <div class="viewsmall form_cont r10px" id="adddosing">
      <div class="form_cap clearfix">
        <span class="fl">添加原料</span>
        <a class="close fr"  @click="close('adddosing')"  href="javascript:void(0);"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>原料名称：</td>
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid" v-model="doSingName"    placeholder="输入原料名称"/>
              </td>
            </tr>
            <tr>
              <td>原料单位：</td>
              <td>
                <select class="ng-untouched ng-pristine ng-valid"  v-model="doSingUnit">
                  <option value="0">--请选择单位--</option>
                  <option  v-for="(doSingItem,index) in unitList" :value="doSingItem.name">{{doSingItem.name}}</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>库存预警：</td>
              <td>
                <input   type="text" class="ng-untouched ng-pristine ng-valid" v-model="stock_warning"    placeholder="输入预警数量"/>
              </td>
            </tr>
            <tr>
              <td>原料编号：</td>
              <td>
                <input   type="text" class="ng-untouched ng-pristine ng-valid" v-model="doSingnumber"    placeholder="输入编号"/>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" @click="addDosing('add')" href="javascript:void(0);">保存</a>
        </div>
      </div>
    </div>
    <!--原料详情-->
    <div class="drawerdetail flex flex-v " id="dosingdetail">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">原料详细信息</span>
          <a class="close fr" @click="close('dosingdetail');" href="javascript:void(0);"></a>
        </div>
        <div class="theinfo">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>原料名称：</td>
              <td>{{doSingDatil.name}}</td>
              <td>原料单位：</td>
              <td>{{doSingDatil.unit}}</td>
            </tr>
            <tr>
              <td>原料编号：</td>
              <td>{{doSingDatil.number}}</td>
              <td>库存预警：</td>
              <td>{{doSingDatil.stock_warning}}</td>
            </tr>
            <tr>
              <td>创建时间：</td>
              <td colspan="2">{{doSingDatil.time}}</td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="theinfo_tbl">
        </div>
      </div>
      <div class="dwdtl_btn">
        <a class="btngreen fr xinzeng" href="javascript:void(0)" @click="popup('adddosing',1)">新增单位</a>
        <a class="roominfo sidelink fr" href="javascript:void(0)" @click="popup('editdosing',1)">修改单位</a>
        <div class="clear"></div>
      </div>
    </div>
    <!--编辑原料-->
    <div class="viewsmall form_cont r10px" id="editdosing">
      <div class="form_cap clearfix">
        <span class="fl">编辑原料</span>
        <a class="close fr"  @click="close('editdosing')"  href="javascript:void(0);"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>原料名称：</td>
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid" v-model="doSingName"    placeholder="输入原料名称"/>
              </td>
            </tr>
            <tr>
              <td>原料单位：</td>
              <td>
                <select class="ng-untouched ng-pristine ng-valid"  v-model="doSingUnit">
                  <option value="0">--请选择单位--</option>
                  <option  v-for="(doSingItem,index) in unitList" :value="doSingItem.name">{{doSingItem.name}}</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>库存预警：</td>
              <td>
                <input   type="text" class="ng-untouched ng-pristine ng-valid" v-model="stock_warning"    placeholder="输入预警数量"/>
              </td>
            </tr>
            <tr>
              <td>原料编号：</td>
              <td>
                <input   type="text" class="ng-untouched ng-pristine ng-valid" v-model="doSingnumber"    placeholder="输入编号"/>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" @click="addDosing('edit')" href="javascript:void(0);">保存</a>
        </div>
      </div>
    </div>
    <!--添加商品分类-->
    <div class="viewsmall form_cont r10px " id="addGoodsClassify">
      <div class="form_cap clearfix">
        <span class="fl">添加商品分类</span>
        <a class="close fr" @click="close('addGoodsClassify');" href="javascript:void(0);"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table mt10">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>分类名称：</td>
              <td>
                <input autofocus="true" placeholder="请输入商品分类名称"  v-model="goodsClssifyName" type="text" class="ng-untouched ng-pristine ng-invalid">
              </td>
            </tr>
            
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen queding " href="javascript:void(0)" @click="addGoodsClassify('add')">确定</a>
        </div>
      </div>
  
    </div>
    <!--修改商品分类-->
    <div class="viewsmall form_cont r10px " id="editgoodsClassify">
      <div class="form_cap clearfix">
        <span class="fl">修改商品分类</span>
        <a class="close fr" @click="close('editgoodsClassify');" href="javascript:void(0);"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table mt10">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>分类名称：</td>
              <td>
                <input autofocus="true" placeholder="请输入商品分类名称"  v-model="goodsClssifyName" type="text" class="ng-untouched ng-pristine ng-invalid">
              </td>
            </tr>
            
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen queding" href="javascript:void(0)" @click="addGoodsClassify('edit');">确定</a>
        </div>
      </div>
  
    </div>
    <!--商品分类详情-->
    <div class="drawerdetail flex flex-v " id="detailGoodsClassify">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">【{{goodsName}}】所有商品</span>
          <a class="close fr" href="javascript:void(0);" @click="close('detailGoodsClassify')"></a>
        </div>
        <div class="theinfo_tbl">
        
          <div class="globaltable r5px">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td>商品名</td>
                <td>单位</td>
                <td>单价</td>
                <td>参与库存</td>
                <td>操作</td>
              </tr>
              <tr v-for="(goods_list,index) in detailClassifyList">
                <td>{{goods_list.goods_name}}</td>
                <td>{{goods_list.unit}}</td>
                <td>{{goods_list.sales_price}}</td>
                <td>{{(goods_list.is_stock!=0) ? '是' : '否'}}</td>
                <td>
                  <a href="javascript:void(0)" @click="editGoods(goods_list.id)">修改</a>
                  <a href="javascript:void(0)" @click="popup('confirm',1,goods_list.id,'商品','goods')">删除</a>
                </td>
              </tr>
              <tr>
                <td colspan="12">
               <div class="page clearfix">
                  <div class="text">共<b>{{detailClassify.pageNum}}</b>页<b>{{detailClassify.count}}</b>条记录</div>
                  <div class="linklist">
                    <a class="prev" href="javascript:void(0)" @click="changePage('goods',page,'prev');" >&nbsp;</a>
                    <a href="javascript:void(0)"   v-for="(pages,index) in paegList"  :class="{'current' : (page==pages)}"   @click="changePage('goods',pages);" >{{pages}}</a>
                    <a class="next" href="javascript:void(0)" @click="changePage('goods',page,'next');" >&nbsp;</a>
                  </div>
                </div>
                </td>
              </tr>
              </tbody></table>
          </div>
        </div>
      </div>
      <div class="dwdtl_btn">
        <a class="btngreen xinzeng fr" href="javascript:void(0)" @click="popup('addgoods',1)">新增商品</a>
        <a class="roominfo sidelink fr" href="javascript:void(0)" @click="popup('editgoodsClassify',1)">修改分类</a>
      </div>
    </div>
    <!--新增商品-->
    <div class="viewroom thin-scroll r10px " id="addgoods">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">新增商品</span>
          <a class="close fr" href="javascript:void(0);" @click="close('addgoods')"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail">
          <div class="form_table">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td><font color="#e64c2e">&nbsp;&nbsp;*</font>商品分类：</td>
                <td>
                  <select disabled="" class="ng-untouched ng-pristine" v-model="classifyId">
                   <option v-for="(goodsClass,index) in goodsClassifyList" :value="goodsClass.id">{{goodsClass.cate_name}}</option>
                  </select>
                </td>
                <td><font color="#e64c2e">&nbsp;&nbsp;*</font>商品名称：</td>
                <td>
                  <input maxlength="50" type="text" class="ng-untouched ng-pristine ng-invalid" v-model="addGoodsName"></td>
            
              </tr>
              <tr>
                <td><font color="#e64c2e">&nbsp;&nbsp;*</font>销售价格：</td>
                <td>
                  <input type="text" class="ng-untouched ng-pristine ng-invalid" v-model="sales_price">&nbsp;元
                </td>
                <td><font color="#e64c2e">&nbsp;&nbsp;*</font>商品单位：</td>
                <td>
                  <select class="ng-untouched ng-pristine ng-valid" v-model="dogoodsUnit">
                    <option value="0">--请选择单位--</option>
                    <option  v-for="(doSingItem,index) in unitList" :value="doSingItem.name">{{doSingItem.name}}</option>
                </select>
                </td>
              </tr>
              <!--<tr style="display: none">-->
                <!--<td style="display: none">商品编码：</td>-->
                <!--<td style="display: none">-->
                  <!--<input placeholder="手动输入" type="text" class="ng-untouched ng-pristine ng-valid" ></td-->
                <!---->
              <!--</tr>-->
              <tr>
                <td><font color="#e64c2e">&nbsp;&nbsp;*</font>报警库存：</td>
                <td>
                  <input type="text" class="ng-untouched ng-pristine ng-valid" v-model="warning_store">&nbsp;
                </td>
                <td>销售成本价：</td>
                <td>
                  <input type="text" class="ng-untouched ng-pristine ng-valid" v-model="buy_price"></td>
                
              </tr>
              <tr>
                <td valign="top">商品原料：</td>
                <td colspan="3">
                  <div class="choosed clearfix">
                    <ul>
                      <li v-for="(seleceDosings,index) in selectDosingList">
                        {{seleceDosings.name}}
                        <a href="javascript:void(0)" @click="delSelectData(seleceDosings.id)"></a>
                      </li>
                      <div class="choosebtn fl"><a href="javascript:void(0)" @click="popup('addgoodsdosing',1)">+添加</a>
                      </div>
                    </ul>
                  </div>
                </td>
              </tr>
              </tbody></table>
          </div>
          <div class="form_stock form_table" style="border-bottom: none">
            <table border="0" cellpadding="0" cellspacing="0" >
              <tbody>
              <tr>
                <td><font color="#e64c2e"></font>商品备注：</td>
                <td>
                  <textarea v-model="goodsRemark"></textarea>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
          <div class="form_stock form_table">
            <div class="stock_ckb" >
              <label><input type="checkbox" :disabled="istoackShow" v-model="is_stock" value="1" class="ng-untouched ng-pristine ng-valid">参与库存计算</label>
              <label><input type="checkbox" v-model="give" value="1" class="ng-untouched ng-pristine ng-valid">是否属于配赠商品</label>
            </div>
            
          </div>
          <div class="form_btn">
            <a class="btngreen baocun" href="javascript:void(0)" @click="addGoodsClassifys('add')">保存</a>
          </div>
        </div>
      </div>
    </div>
    <!--编辑商品-->
    <div class="viewroom thin-scroll r10px " id="editgoods">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">修改商品</span>
          <a class="close fr" href="javascript:void(0);" @click="close('editgoods')"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail">
          <div class="form_table">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td><font color="#e64c2e">&nbsp;&nbsp;*</font>商品分类：</td>
                <td>
                  <select  class="ng-untouched ng-pristine" v-model="classifyId">
                    <option v-for="(goodsClass,index) in goodsClassifyList" :value="goodsClass.id">{{goodsClass.cate_name}}</option>
                  </select>
                </td>
                <td><font color="#e64c2e">&nbsp;&nbsp;*</font>商品名称：</td>
                <td>
                  <input maxlength="50" type="text" class="ng-untouched ng-pristine ng-invalid" v-model="addGoodsName"></td>
            
              </tr>
              <tr>
                <td><font color="#e64c2e">&nbsp;&nbsp;*</font>销售价格：</td>
                <td>
                  <input type="text" class="ng-untouched ng-pristine ng-invalid" v-model="sales_price">&nbsp;元
                </td>
                <td><font color="#e64c2e">&nbsp;&nbsp;*</font>商品单位：</td>
                <td>
                  <select class="ng-untouched ng-pristine ng-valid" v-model="dogoodsUnit">
                    <option value="0">--请选择单位--</option>
                    <option  v-for="(doSingItem,index) in unitList" :value="doSingItem.name">{{doSingItem.name}}</option>
                  </select>
                </td>
              </tr>
              <!--<tr style="display: none">-->
              <!--<td style="display: none">商品编码：</td>-->
              <!--<td style="display: none">-->
              <!--<input placeholder="手动输入" type="text" class="ng-untouched ng-pristine ng-valid" ></td-->
              <!---->
              <!--</tr>-->
              <tr>
                <td><font color="#e64c2e">&nbsp;&nbsp;*</font>报警库存：</td>
                <td>
                  <input type="text" class="ng-untouched ng-pristine ng-valid" v-model="warning_store">&nbsp;
                </td>
                <td>销售成本价：</td>
                <td>
                  <input type="text" class="ng-untouched ng-pristine ng-valid" v-model="buy_price"></td>
            
              </tr>
              <tr>
                <td valign="top">商品原料：</td>
                <td colspan="3">
                  <div class="choosed clearfix">
                    <ul>
                      <li v-for="(seleceDosings,index) in selectDosingList">
                        {{seleceDosings.name}}
                        <a href="javascript:void(0)" @click="delSelectData(seleceDosings.id)"></a>
                      </li>
                      <div class="choosebtn fl"><a href="javascript:void(0)" @click="popup('addgoodsdosing',1)">+添加</a>
                      </div>
                    </ul>
                  </div>
                </td>
              </tr>
              </tbody></table>
          </div>
          <div class="form_stock form_table" style="border-bottom: none">
            <table border="0" cellpadding="0" cellspacing="0" >
              <tbody>
              <tr>
                <td><font color="#e64c2e"></font>商品备注：</td>
                <td>
                  <textarea v-model="goodsRemark"></textarea>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
          <div class="form_stock form_table">
            <div class="stock_ckb" >
              <label><input  type="checkbox"  @click="istoackMsg()" v-model="is_stock" :value="is_stock" class="ng-untouched ng-pristine ng-valid">参与库存计算</label>
              <label><input type="checkbox" v-model="give" value="1" class="ng-untouched ng-pristine ng-valid">是否属于配赠商品</label>
            </div>
        
          </div>
          <div class="form_btn">
            <a class="btngreen baocun" href="javascript:void(0)" @click="addGoodsClassifys('edit')">保存</a>
          </div>
        </div>
      </div>
    </div>
    <!--添加商品选择原料-->
    <div class="viewroom thin-scroll r10px viewspendingroom  "  id="addgoodsdosing" style="z-index: 9999">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">添加原料</span>
          <a class="close fr" href="javascript:void(0);" @click="close('addgoodsdosing')"></a>
        </div>
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_detail nv_cont thin-scroll">
          <div class="spending_table flex">
            <div class="g_table flex-1">
              <div class="tab"><span class="caption current">可选原料</span></div>
              <div class="cont">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr class="header">
                    <td class="txt_left" style="width: 150px;">名称</td>
                    <td>数量</td>
                    <td>操作</td>
                  </tr>
                 <tr v-for="(dosingdata,index) in dosingPageList.list">
                    <td class="left" width="150px;">{{dosingdata.name}}</td>
                    <td class="quantity">
                      <a class="r3px" href="javascript:void(0)" @click="changeDosing(dosingdata.id,dosingdata.name,'prev')">-</a>
                      <input type="text" class="ng-untouched ng-pristine ng-valid  change"  :id="'changid'+dosingdata.id" :value="1">
                      <a class="r3px" href="javascript:void(0)" @click="changeDosing(dosingdata.id,dosingdata.name,'next')">+</a>
                    </td>
                    <td><a href="javascript:void(0)" @click="addDosinglist(dosingdata.id,dosingdata.name)">添加</a>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div class="page clearfix">
                <div class="text">共<b>{{dosingPageList.pageNum}}</b>页<b>{{dosingPageList.count}}</b>条记录</div>
              <div class="linklist">
                <a class="prev" href="javascript:void(0)" @click="changePage('dosing',dosingPage,'prev');" >&nbsp;</a>
                <a href="javascript:void(0)"   v-for="(pagess,index) in dosingpaegData"  :class="{'current' : (dosingPage==pagess)}"   @click="changePage('dosing',pagess);" >{{pagess}}</a>
                <a class="next" href="javascript:void(0)" @click="changePage('dosing',dosingPage,'next');" >&nbsp;</a>
              </div>
            </div>
            </div>
            <div class="c_table flex-1">
              <div class="tab"><span class="caption">已选原料</span></div>
              <div class="cont">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr class="header">
                    <td class="txt_left">名称</td>
                    <td>数量</td>
                    <td>操作</td>
                  </tr>
                 <tr v-for="(selectData,index) in selectDosingList">
                    <td class="left" style="width: 150px;">{{selectData.name}}</td>
                    <td class="quantity">{{selectData.count}}
                    </td>
                    <td><a href="javascript:void(0)"  @click="delSelectData(selectData.id)">删除</a>
                    </td>
                  </tr>
                  </tbody></table>
              </div>
            </div>
          </div>
          <div class="form_btn clearfix">
            <a class="btngreen fr diandan" href="javascript:void(0)" @click="addDosingConfirm()">添加</a>
          </div>
        </div>
      </div>
    </div>
    <!--优惠设置-->
    <div class="drawerdetail flex flex-v "  id="privilege" >
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix mt10">
          <span class="fl">手动优惠幅度详情</span>
          <a class="close fr" href="javascript:void(0);" @click="close('privilege')"></a>
        </div>
        <div class="theinfo_tbl mt10 fs14">
          <div class="globaltable r5px">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td>单笔账单总金额(起)</td>
                <td>单笔账单总金额(止)</td>
                <td>最大优惠金额</td>
                <td>操作</td>
              </tr>
              <tr v-for="(privilegeData,index) in privilegeList">
                <td>{{privilegeData.min_money}}元</td>
                <td>{{privilegeData.max_money}}元</td>
                <td>{{privilegeData.discount_money}}元</td>
                <td>
                  <a href="javascript:void(0);" @click="editprivilege(privilegeData.id,privilegeData.min_money,privilegeData.max_money,privilegeData.discount_money)">修改</a>
                  <a href="javascript:void(0);" @click="popup('confirm',1,privilegeData.id,'优惠','privilege')">删除</a>
                </td>
              </tr>
              </tbody></table>
          </div>
        </div>
      </div>
      <div class="dwdtl_btn">
        <a class="btngreen fr xinzeng" href="javascript:void(0);" @click="popup('addprivilege',1)">新增区间</a>
        <div class="clear"></div>
      </div>
    </div>
    <!--添加优惠-->
    <div class="viewsmall form_cont r10px " id="addprivilege">
      <div class="form_cap clearfix">
        <span class="fl">添加手动优惠区间</span>
        <a class="close fr" href="javascript:void(0);" @click="close('addprivilege')"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>起始值：</td>
              <td>
                <input autofocus="true" placeholder="请输入区间起始值（元）" v-model="privilegeStatr" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            <tr>
              <td>结束值：</td>
              <td>
                <input autofocus="true" placeholder="请输入区间结束值（元）" v-model='privilegeEnd' type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            <tr>
              <td>优惠额度：</td>
              <td>
                <input autofocus="true" placeholder="请输入最大优惠额度（元）" v-model="privilegePrice"  type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            </tbody></table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);" @click="privilege('add')">保存</a>
        </div>
      </div>
    </div>
    <!--修改优惠-->
    <div class="viewsmall form_cont r10px " id="editprivilege">
      <div class="form_cap clearfix">
        <span class="fl">修改手动优惠区间</span>
        <a class="close fr" href="javascript:void(0);" @click="close('editprivilege')"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>起始值：</td>
              <td>
                <input autofocus="true" placeholder="请输入区间起始值（元）" v-model="privilegeStatr" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            <tr>
              <td>结束值：</td>
              <td>
                <input autofocus="true" placeholder="请输入区间结束值（元）" v-model='privilegeEnd' type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            <tr>
              <td>优惠额度：</td>
              <td>
                <input autofocus="true" placeholder="请输入最大优惠额度（元）" v-model="privilegePrice"  type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            </tbody></table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);" @click="privilege('edit')">保存</a>
        </div>
      </div>
    </div>
    <!--添加和修改交班设置-->
    <div class="viewsmall form_cont r10px " id="handworkView" >
      <div class="form_cap clearfix">
        <span class="fl">预留现金配置</span>
        <a class="close fr" href="javascript:void(0);" @click="close('handworkView')"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>预留现金：</td>
              <td>
                <input autofocus="true" placeholder="" v-model="handwork" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            
            </tbody></table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);" @click="addHandWork()">保存</a>
        </div>
      </div>
    </div>
    <!--添加员工-->
    <div class="viewsmall form_cont r10px " id="addUser">
      <div class="form_cap clearfix">
        <span class="fl">添加员工</span>
        <a class="close fr" href="javascript:void(0);" @click="close('addUser')"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>手机号码：</td>
              <td>
                <input autofocus="true" placeholder="请输入手机号码" v-model="staffPhone" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
            <tr>
              <td>员工姓名：</td>
              <td>
                <input autofocus="true"  placeholder="请输入员工姓名）" v-model='staffName' type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
            <tr>
              <td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
              <td>
                <input autofocus="true" placeholder="请输密码" v-model='staffPwd' type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
            <tr>
              <td>权限角色：</td>
              <td>
                <select v-model="staffRole">
                  <option value="0">--请选择--</option>
                  <option v-for="(rolelits,index) in roleList" :value="rolelits">{{rolelits}}</option>
                </select>
              </td>
            </tr>
            </tbody></table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);" @click="staff('add')">保存</a>
        </div>
      </div>
    </div>
    <!--修改员工-->
    <div class="viewsmall form_cont r10px " id="editUser">
      <div class="form_cap clearfix">
        <span class="fl">编辑员工</span>
        <a class="close fr" href="javascript:void(0);" @click="close('editUser')"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="form_detail">
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>手机号码：</td>
              <td>
                <input autofocus="true" placeholder="请输入手机号码" v-model="staffPhone" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
            <tr>
              <td>员工姓名：</td>
              <td>
                <input autofocus="true"  placeholder="请输入员工姓名" v-model='staffName' type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
            <tr>
              <td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
              <td>
                <input autofocus="true" placeholder="请输密码" v-model='staffPwd' type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
            <tr>
              <td>权限角色：</td>
              <td>
                <select v-model="staffRole">
                  <option value="0">--请选择--</option>
                  <option v-for="(rolelits,index) in roleList" :value="rolelits">{{rolelits}}</option>
                </select>
              </td>
            </tr>
            </tbody></table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);" @click="staff('edit')">保存</a>
        </div>
      </div>
    </div>
    <!--员工详情-->
    <div id="staffinfo" class="drawerdetail flex flex-v">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">员工详细信息</span>
          <a class="close fr" href="javascript:void(0);" @click="close('staffinfo')"></a>
        </div>
        <div class="theinfo">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>员工名称：</td>
              <td>{{staffInfo.user}}</td>
              <td>手机：</td>
              <td>{{staffInfo.phone}}</td>
            </tr>
            <tr>
              <td>角色：</td>
              <td>{{staffInfo.role_name}}</td>
              <td> 创建时间：</td>
              <td>{{staffInfo.add_time}}</td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="theinfo_tbl">
        </div>
      </div>
      <div class="dwdtl_btn">
        <a class="btngreen fr xinzeng" href="javascript:void(0)" @click="popup('addUser',1)">新增员工</a>
        <a class="roominfo sidelink fr" v-if="staffInfo.is_admin==0" href="javascript:void(0)"  @click="popup('editUser',1)">修改员工</a>
        <div class="clear"></div>
      </div>
    </div>
    <!--员工详情/end-->
    <!--公共删除弹出框-->
    <div class="viewwarning r10px "  id="confirm">
      <div class="caption clearfix">
        <span class="fl">询问</span>
        <a class="close fr" @click="close('confirm')" href="javascript:void(0);"></a>
      </div>
      <!--报错模板-->
      <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
      <div class="conts">
        <p>您确认删除该{{delText}}吗？</p>
        <div class="button">
          <a href="javascript:void(0);" @click="close('confirm')">取消</a>
          <a class="btnred confirm r3px" href="javascript:void(0);"  @click="delConfirm()">确定</a>
        </div>
      </div>
    </div>
<!--弹出框列表/end-->
    <!--门店信息-->
    <div class="drawerdetail flex flex-v" id="Stores">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">门店详细信息</span>
          <a class="close fr" href="javascript:void(0);" @click="close('Stores')"></a>
        </div>
        <div class="theinfo">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
              <tr>
                <td>门店编号：</td>
                <td>20170301346421</td>
                <td>门店名称：</td>
                <td>我的茶楼</td>
              </tr>
              <tr>
                <td>联系人：</td>
                <td>琳琳</td>
                <td>联系电话：</td>
                <td>18302801586</td>
              </tr>
              <tr>
                <td>门店地址：</td>
                <td>四川省成都市武侯区环球中心</td>
              </tr>
              <tr>
              
                <td>创建时间：</td>
                <td>2017-03-01 09:37:22</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="theinfo_tbl">
        </div>
      </div>
      <div v-if="false" class="dwdtl_btn">
        <a class="btngreen fr xiugai" href="javascript:void(0)">修改门店</a>
        <div class="clear"></div>
      </div>
    </div>
    <!--新增门店-->
    <div v-if="false" class="viewroom thin-scroll r10px " id="addStores">
      <div class="viewbox r10px form_cont">
    <div class="form_cap clearfix">
      <span class="fl">新增门店</span>
      <a class="close fr" href="javascript:void(0)" @click="close('addStores')"></a>
    </div>
    <div class="form_detail">
      <div class="form_table">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td><em class="colorred">*&nbsp;</em>门店名称：</td>
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-invalid">
              </td>
              <td>联系人：</td>
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
            <tr>
              <td>联系电话：</td>
              <td colspan="3">
                <input type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
            <tr>
              <td>门店地址：</td>
              <td colspan="3">
                <select style="width: 170px" class="ng-untouched ng-pristine ng-valid">
                  <option value="0">请选择省</option>
                  <option value="1120">安徽省</option>
                  <option value="3513">澳门特别行政区</option>
                  <option value="2">北京市</option>
                  <option value="1258">福建省</option>
                </select>
                <select style="width: 170px" class="ng-untouched ng-pristine ng-valid">
                  <option value="0">请选择市</option>
                </select>
                <select style="width: 165px" class="ng-untouched ng-pristine ng-valid">
                  <option value="0">请选择县(区)</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>街道地址：</td>
              <td colspan="3">
                <input style="width: 513px" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form_btn">
        <a class="btngreen baocun" href="javascript:void(0)">保存</a>
      </div>
    </div>

  </div>
    </div>
    <!--遮罩-->
    <div>
      <div class="bgblack "></div>
    </div>
    <!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
  </div>
</template>
<script>
  import {mapGetters,mapActions} from 'vuex';
  export default{
  	data(){
  		return {
        isLoading: false,
        iSsuccess:false,
        msgShow: false,
        msg: '',
        changeId:'',
        delText:'',
        delAction:'',
        roleUrl:[],
        roleName:'',
        roleNames:'',
        page:1,
        dosingPage:1,
        paegList:[],
        dosingpaegData:[],
        qrcodeUrl:'',
        rbaclistaction:[],//二级权限选中
        roleInitData:[],//初始化权限列表
        rbacDetailList:[],//三级权限列表
        rbacList:[],//二级权限列表
        rbacListIndex:0,//二级权限默认索引
        unitName:'',//单位名称
        unitList:[],//单位列表
        unitDetail:[],
        doSingName:'',
        doSingUnit:0,
        stock_warning:'',
        doSingnumber:'',
        doSingList:[],
        doSingDatil:[],
        goodsClssifyName:'',
        goodsClassifyList:[],
        detailClassify:[],
        goodsName:'',
        detailClassifyList:[],
        addGoodsName:'',//添加商品名称
        dogoodsUnit:0,//商品单位
        goodsCode:'',//商品编码
        buy_price:'',//商品价格
        is_stock:false,
        give:false,
        sales_price:'',
        goodsRemark:'',
        warning_store:'',
        goodsDosingList:[],
        privilegeStatr:'',
        privilegeEnd:'',
        privilegePrice:'',
        privilegeList:[],
        dosingPageList:[],
        selectDosingList:[],
        selsectShow:false,
        goodsId:'',
        classifyId:'',
        istoackShow:false,
        handwork:'',
        staffPhone:'',
        staffName:'',
        staffPwd:'',
        staffRole:0,
        staffList:[],
        roleList:[],
        staffInfo:[],
        getRoleList:[],
        role:[],//权限
        is_storks:true,
      }
    },
    computed:mapGetters(['getInit']),
    methods: {
    //弹出框显示隐藏
      popup (id,open,openid,name,action){
       if(id=='addgoodsdosing'){
       	$('.bgblack').css('z-index','9998')
       }
      if(openid){
          if(action){
            if(action=='goods'){
              this.goodsId=openid;
            }else{
              this.changeId=openid;
            }
          }else {
            this.changeId=openid;
          }
        }
        if(id=='addrole'){
          this.roleUrl=[];
          this.rbaclistaction=[];
        }
        if(name){
          this.delText=name;
        }
        if(action){
          this.delAction=action;
          if(action=='goods'){
            this.goodsId=openid;
          }
        }
        $('.drawerdetail').each(function(){
        	if($(this).attr('id')==id){
        		$(this).addClass('in');
          }else{
            $(this).removeClass('in');
          }
        });
        var id = '#'+id;
        $(id).addClass('in');
        var open = open;
        if(open==1){
          $('.bgblack').addClass('in');
        }
      },
      close(id){
        if(id=='addgoodsdosing'){
          $('.bgblack').css('z-index','997');
          $('.bgblack').addClass('in');
        }else {
          $('.bgblack').removeClass('in');
        }
        this.roleName='';
        this.roleNames='';
        if(id=='staffinfo'){
          this.staffPhone='';
          this.staffName='';
          this.staffPwd='';
          this.staffRole=0;
        }
        var id = '#'+id;
        $(id).removeClass('in');
        //this.changeId='';
        this.privilegeStatr='';
        this.privilegeEnd='';
        this.privilegePrice='';
        if(!this.selsectShow){
          this.selectDosingList=[];
        }
        this.dosingPage=1;
        
      },
      //判断是否能选择加入库存计算
      istoackMsg(){
      	
      	if(	this.is_storks){
      		
        }else{
          if(this.is_stock){
            this.msgHint('绑定原料时不能选择此选项');
            this.is_stock=false;
          }
        }
      	
      },
      //导航切换
      navclick(ids){
        var id= parseInt(ids);
      	$('.changecnav').eq(id).addClass('current').siblings('.changecnav').removeClass('current');
      	if(id){
      		$('.settdl').each(function(i){
      			if(id==i+1){
      				$(this).show();
            }else{
      				$(this).hide();
            }
          })
        }else{
          $('.settdl').each(function(i){
              $(this).show();
          })
        }
      },
      //删除
      delConfirm(){
      	var _this=this;
      	switch (_this.delAction){
          case 'unit' :
          	_this.ajax(_this.port.unitDel,{unit_id:_this.changeId},'post',function (res) {
          		if(res.code==1){
          			_this.unitInit();
          			_this.close('confirm');
              }else{
          			_this.msgHint(res.msg);
              }
            })
          break;
          case 'dosing' :
            _this.ajax(_this.port.deltsing,{dosing_id:_this.changeId},'post',function (res) {
              if(res.code==1){
                _this.dosingInit();
                _this.close('confirm');
              }else{
                _this.msgHint(res.msg);
              }
            })
          break;
          case 'goodsclassify':
            _this.ajax(_this.port.delgoodsClassify,{cate_id:_this.changeId},'post',function (res) {
              if(res.code==1){
                _this.goodsClassifyInit();
                _this.close('confirm');
              }else{
                _this.msgHint(res.msg);
              }
            })
          break;
          case 'privilege' :
            _this.ajax(_this.port.delDiscount,{discount_id:_this.changeId},'post',function (res) {
              if(res.code==1){
                _this.discountInit();
                _this.close('confirm');
              }else{
                _this.msgHint(res.msg);
              }
            })
          break;
          case 'goods' :
            _this.ajax(_this.port.goodsDel,{goods_id:_this.goodsId},'post',function (res) {
              if(res.code==1){
                _this.goodsClassifyInit();
                _this.goodsclassifyDetail(_this.changeId,_this.goodsName);
                _this.close('confirm');
              }else{
                _this.msgHint(res.msg);
              }
            })
          break;
          case 'staff':
            _this.ajax(_this.port.staffDel,{users_id:_this.changeId},'post',function (res) {
              if(res.code==1){
                _this.initStaffList();
                _this.close('confirm');
              }else{
                _this.msgHint(res.msg);
              }
            })
            break;
          case 'role':
            _this.ajax(_this.port.delRole,{role_name:_this.changeId},'post',function (res) {
              if(res.code==1){
                _this.initRoleList();
                _this.close('confirm');
              }else{
                _this.msgHint(res.msg);
              }
            })
            break;
        }
      },
      //点击三级权限
      selectrole(index){
        var _this=this;
        var num=0;
        var rbacTwoNum =_this.rbacList[index]['list'].length;
        for( var i=0;i<rbacTwoNum;i++){
        	
        	for(var j=0;j<_this.roleUrl.length;j++){
        		if(_this.rbacList[index]['list'][i]['value']==_this.roleUrl[j]){
        			num++;
            }
          }
        }
       if(num==rbacTwoNum){
        	_this.rbaclistaction.push(_this.rbacList[index]['name']);
       }else{
       	  for(var m=0;m<_this.rbaclistaction.length;m++){
       	  	if(_this.rbaclistaction[m]==_this.rbacList[index]['name']){
     
              _this.rbaclistaction.splice(m,1);
            }
          }
       }
      },
      //初始化权限列表
      rbacInit(){
        this.rbacDetailList=[];//三级权限列表
        this.rbacList=[];//二级权限列表
      	var _this=this;
      	this.ajax(this.port.roleInit,'','get',function (res) {
          if(res.code==1){
          	_this.roleInitData=res.data;
            for(var i=0;i<res.data[0]['list'].length;i++){
              _this.rbacList.push(res.data[0]['list'][i]);
            }
            for(var j=0;j<res.data[0]['list'][0]['list'].length;j++){
              _this.rbacDetailList.push(res.data[0]['list'][0]['list'][j]);//三级权限列表
            }
          }
        })
      },
      //切换一级权限
      changeRbacList(index){
        this.rbacListIndex=0;
      	$('.rbacindex').eq(index).addClass('current').parent('dd').siblings('dd').children('a').removeClass('current');
      	$('.rbacindexedit').eq(index).addClass('current').parent('dd').siblings('dd').children('a').removeClass('current');
        $(".rbacdetail").eq(0).children('a').addClass('current');
        $(".rbacdetailedit").eq(0).children('a').addClass('current');
        $(".rbacdetail").eq(0).siblings('li').children('a').removeClass('current');
        $(".rbacdetailedit").eq(0).siblings('li').children('a').removeClass('current');
      	var _this=this;
        this.rbacDetailList=[];//三级权限列表
        this.rbacList=[];//二级权限列表
        for(var i=0;i<_this.roleInitData[index]['list'].length;i++){
          _this.rbacList.push(_this.roleInitData[index]['list'][i]);
        }
        for(var j=0;j<_this.roleInitData[index]['list'][0]['list'].length;j++){
          _this.rbacDetailList.push(_this.roleInitData[index]['list'][0]['list'][j]);//三级权限列表
        }
      },
      //切换二级权限
      changeRbacDetail(index){
      	this.rbacListIndex=index;
        var _this=this;
        _this.rbacDetailList=[];
      	$(".rbacdetail").eq(index).children('a').addClass('current');
      	$(".rbacdetailedit").eq(index).children('a').addClass('current');
      	$(".rbacdetail").eq(index).siblings('li').children('a').removeClass('current');
      	$(".rbacdetailedit").eq(index).siblings('li').children('a').removeClass('current');
        for(var j=0;j<_this.rbacList[index]['list'].length;j++){
          _this.rbacDetailList.push(_this.rbacList[index]['list'][j]);//三级权限列表
        }
      },
      //选中二级权限时全选三级权限
      selectAll(name,index){
        this.rbacListIndex=index;
      	var _this=this;
        //_this.rbaclistaction
        if(_this.rbaclistaction.length==0){
          _this.roleUrl=[];
        }else{
          
          for(var i=0;i<_this.rbaclistaction.length;i++){
            if(_this.rbaclistaction[i]==name){
            	//处理点击选中
              for(var j=0;j<_this.rbacList[index]['list'].length;j++){
                _this.roleUrl.push(_this.rbacList[index]['list'][j]['value']);
              }
            }
          }
          //处理点击取消
          if(_this.rbaclistaction.indexOf(name)==-1){
            for(var m=0;m<_this.rbacList.length;m++){
            	if(_this.rbacList[m]['name']==name){
               for(var n=0;n<_this.rbacList[m]['list'].length;n++){
                 _this.roleUrl.splice(_this.getIndex(_this.rbacList[m]['list'][n]['value']),1);
               }
              }
            }
          }
        }
        _this.roleUrl=_this.unrepe(_this.roleUrl);
      },
      //获取取消权限的索引
      getIndex(name){
      	var _this=this;
      	var result;
      	for(var i=0;i<_this.roleUrl.length;i++){
      		if(_this.roleUrl[i]==name){
      			result=i;
          }
        }
      	return result;
      },
      //去重
      unrepe(arr){
          var result=[];
          var hash={};
          for(var i=0;i<arr.length;i++){
            if(!hash[arr[i]]){
              result.push(arr[i]);
              hash[arr[i]]=true;
            }
          }
        return result;
      },
      //保存角色
      addRbac(type){
      	var data,url;
      	var _this=this;
      	if(type=='add'){
          if(_this.roleName==''){
            _this.msgHint('请填写角色名称');
            return
          }
        }
        if(_this.roleUrl.length==0){
          _this.msgHint('请添加权限');
          return
        }
        if(type=='add'){
          data={
            role_name:_this.roleName,
            role_list:_this.roleUrl
          };
          url=_this.port.addRole;
        }else{
          data={
            role_name:_this.roleName,
            role_list:_this.roleUrl
          };
          url=_this.port.editRole;
        }
        _this.ajax(url,data,'post',function (res) {
          if(res.code==1){
            _this.roleName='';
            _this.roleUrl=[];
            _this.rbaclistaction=[];
            _this.initRoleList();
            _this.close('addrole');
            _this.close('roleinfo');
            _this.close('editrole');
            _this.rbacInit();
          }else{
          	_this.msgHint(res.msg);
          }
        })
      },
      //角色详情
      roleDetail(id){
      	var _this=this;
      	_this.roleNames=id;
      	_this.roleName=id;
      	_this.ajax(_this.port.editRole,{role_name:id},'get',function (res) {
          if(res.code==1){
          	_this.getRoleList=[];
          	var datalist =res.data;
            _this.getRoleList =res.data;
            _this.rbaclistaction=[];
            _this.roleUrl=[];
            var html='';
            var html1='';
            var html2='';
            $('#tab1').empty();
            $('#tab2').empty();
            $('#tab3').empty();
            if(id!='超级管理员'){
          	for(var i=0;i<datalist.length;i++){
          		var count=0;
              for(var s=0;s<datalist[i]['list'].length;s++){
                for(var n=0;n<datalist[i]['list'][s]['list'].length;n++){
                  count++;
                }
              }
                html+='<div  class="tb2" style=" height:'+count*30+'px;line-height: '+count*30+'px;">'+datalist[i]['name']+'</div>';
              for(var j=0;j<datalist[i]['list'].length;j++){
                _this.rbaclistaction.push(datalist[i]['list'][j]['name']);
                html1+='<div class="tb3" style="height:'+datalist[i]['list'][j]['list'].length*30+'px;line-height:'+datalist[i]['list'][j]['list'].length*30+'px; ">'+datalist[i]['list'][j]['name']+'</div>';
                for(var m=0;m<datalist[i]['list'][j]['list'].length;m++){
                  _this.roleUrl.push(datalist[i]['list'][j]['list'][m]['value']);
                  html2+=' <div class="tb5" >'+datalist[i]['list'][j]['list'][m]['name']+'</div>'
                }
              }
            }
            $('#tab1').append(html);
            $('#tab2').append(html1);
            $('#tab3').append(html2);
           
            }
            _this.popup('roleinfo',0);
          }
        })
      },
      //初始化单位列表
      unitInit(){
        var _this = this;
        _this.unitList=[];
        this.ajax(this.port.unitinit, {}, 'get', function (res) {
          if (res.code == 1) {
            _this.unitList=res.data;
          }
        })
      },
      //获取单位详情
      getUnitDetil(id,name){
      	var _this=this;
      	_this.changeId=id;
      	_this.unitName=name;
        _this.unitDetail=[];
      	_this.ajax(_this.port.unitOne,{unit_id:_this.changeId},'get',function (res) {
          if(res.code==1){
            _this.unitDetail=res.data;
            _this.popup('unitdetail',0);
          }
      		
        })
      },
      //添加单位
      addUnit(type){
      	var _this=this;
      	var url;
      	var data;
      	if(this.unitName==''){
      		_this.msgHint('单位不能为空');
      		return ;
        }
        if(type=='add'){
      		url=this.port.addunit;
      		data={
            name:this.unitName
          };
        }else{
          url=this.port.unitedit;
          data={
            name:this.unitName,
            unit_id:_this.changeId
          }
        }
      	this.ajax(url,data,'post',function (res) {
          if(res.code==1){
          	_this.unitName='';
            _this.unitInit();
            _this.close('unit');
            _this.close('editUnit');
            _this.close('unitdetail');
            
          }else{
            _this.msgHint(res.msg);
          }
        })
        
      },
      //初始化原料数据
      dosingInit(){
        var _this = this;
        _this.doSingList=[];
        this.ajax(this.port.doSingInit, {}, 'get', function (res) {
          if (res.code == 1) {
            _this.doSingList=res.data;
          }
        })
      },
      //添加原料
      addDosing(type){
        var _this=this;
        var url;
        var data;
        if(this.doSingName==''){
          _this.msgHint('原料名称不能为空');
          return ;
        }
        if(this.doSingUnit==0){
          _this.msgHint('请选择原料单位');
          return ;
        }
        if(!/^[1-9]\d{0,5}$/.test(this.stock_warning)){
          _this.msgHint('请输入库存预警');
          return ;
        }
        
        if(type=='add'){
          url=this.port.addDoSingInit;
          data={
            name:this.doSingName,
            unit:this.doSingUnit,
            stock_warning:this.stock_warning,
            number:this.doSingnumber
          };
        }else{
          url=this.port.editsing;
          data={
            dosing_id:_this.changeId,
            name:this.doSingName,
            unit:this.doSingUnit,
            stock_warning:this.stock_warning,
            number:this.doSingnumber
          }
        }
        this.ajax(url,data,'post',function (res) {
          if(res.code==1){
            _this.doSingName='';
            _this.doSingUnit=0;
            _this.stock_warning='';
            _this.doSingnumber='';
            _this.dosingInit();
           _this.close('adddosing');
           _this.close('editdosing');
          _this.close('dosingdetail');
      
          }else{
            _this.msgHint(res.msg);
          }
        })
      	
      },
      //获取原料详情
      getdosingDetil(id,name,stock_warning,code,unit){
        var _this=this;
        _this.changeId=id;
        _this.doSingName=name;
        _this.doSingUnit=unit;
        _this.stock_warning=stock_warning;
        _this.doSingnumber=code;
        _this.doSingDatil=[];
        _this.ajax(_this.port.dosingOne,{dosing_id:_this.changeId},'get',function (res) {
          if(res.code==1){
            _this.doSingDatil=res.data;
            _this.popup('dosingdetail',0);
          }
    
        })
      },
      //添加和修改商品分类名称
      addGoodsClassify(type){
        var _this=this;
        var url;
        var data;
        if(this.goodsClssifyName==''){
          _this.msgHint('分类名称不能为空');
          return ;
        }
        if(type=='add'){
          url=this.port.addGoodsClass;
          data={
            cate_name:this.goodsClssifyName
          };
        }else{
          url=this.port.editGoodsClass;
          data={
            cate_id:_this.changeId,
            cate_name:this.goodsClssifyName
          }
        }
        this.ajax(url,data,'post',function (res) {
          if(res.code==1){
           _this.goodsClassifyInit();
            _this.close('addGoodsClassify');
            _this.close('editgoodsClassify');
           _this.close('detailGoodsClassify');
      
          }else{
            _this.msgHint(res.msg);
          }
        })
  
  
      },
      //商品分类初始化
      goodsClassifyInit(){
        var _this = this;
        _this.goodsClassifyList=[];
        this.ajax(this.port.goodsClassify, {}, 'get', function (res) {
          if (res.code == 1) {
            _this.goodsClassifyList=res.data;
          }
        })
      },
      //商品分类详情
      goodsclassifyDetail(id,name){
        var _this=this;
        _this.changeId=id;
        _this.goodsName=name;
        _this.goodsClssifyName=name;
        _this.classifyId=id;
        _this.ajax(_this.port.detailgoodsClassify,{cate_id:_this.changeId,page:_this.page},'get',function (res) {
          if(res.code==1){
            _this.detailClassify=[];
            _this.detailClassifyList=[];
            _this.paegList=[];
            _this.detailClassify=res.data;
            _this.detailClassifyList=res.data.list.goods;
            for (var i = 1; i <= res.data['pageNum']; i++) {
              _this.paegList.push(i);
            }
            _this.popup('detailGoodsClassify',0);
          }
        })
      },
      //优惠列表
      discountInit(){
      	var  _this=this;
      	this.ajax(this.port.discount,{},'get',function (res) {
          if(res.code==1){
          	_this.privilegeList=[];
          	_this.privilegeList=res.data;
          }
        })
      },
      //修改优惠
      editprivilege(id,minMoney,maxMoney,conutMoney){
        this.changeId=id;
        this.privilegeStatr=minMoney;
        this.privilegeEnd=maxMoney;
        this.privilegePrice=conutMoney;
        this.popup('editprivilege',1)
      },
      //优惠设置添加与修改
      privilege(type){
        var _this=this;
        var url;
        var data;
        if(!/^[0-9]{1}\d{0,10}$/.test(this.privilegeStatr.split('.')[0])){
          _this.msgHint('请输入有效的数字');
          return ;
        }
        if((parseInt(this.privilegeEnd)<parseInt(this.privilegeStatr)) && /^[1-9]{1}\d{0,10}$/.test(this.privilegeEnd.split('.')[0])){
          _this.msgHint('请输入有效的数字或不能小于初始值');
          return ;
        }
        if(!/^[1-9]{1}\d{0,10}$/.test(this.privilegePrice.split('.')[0])){
          _this.msgHint('请输入有效的数字');
          return ;
        }
        if(type=='add'){
          url=this.port.addDiscount;
          data={
            min_money:this.privilegeStatr,
            max_money:this.privilegeEnd,
            discount_money:this.privilegePrice
          };
        }else{
          url=this.port.editDiscount;
          data={
            discount_id:this.changeId,
            min_money:this.privilegeStatr,
            max_money:this.privilegeEnd,
            discount_money:this.privilegePrice
          }
        }
        this.ajax(url,data,'post',function (res) {
          if(res.code==1){
            _this.discountInit();
            _this.close('addprivilege');
            _this.close('editprivilege');
          }else{
            _this.msgHint(res.msg);
          }
        })
  
      },
      //原料分页数据初始化
      dosingPageInit(){
      	var _this=this;
      	this.ajax(this.port.dosingPage,{page:this.dosingPage},'get',function (res) {
          if(res.code==1){
          	_this.dosingPageList=[];
            _this.dosingpaegData=[];
          	_this.dosingPageList=res.data;
            for (var i = 1; i <= res.data['pageNum']; i++) {
              _this.dosingpaegData.push(i);
            }
          }
        })
      },
      //切换分页
      changePage(action,page,type){
      	
      	if(action=='goods'){
          if(type) {
            if (type == 'prev') {
              if (page > 1) {
                page--;
                this.page = page;
              } else {
                return;
              }
            } else {
              if (page < this.detailClassify['pageNum']) {
                page++;
                this.page = page;
              } else {
                return;
              }
            }
          }else{
            this.page=page;
          }
          
          this.goodsclassifyDetail(this.changeId,this.goodsName);
        }else{
          if(type) {
            if (type == 'prev') {
              if (page > 1) {
                page--;
                this.dosingPage = page;
              } else {
                return;
              }
            } else {
              if (page < this.dosingPageList['pageNum']) {
                page++;
                this.dosingPage = page;
              } else {
                return;
              }
            }
          }else{
            this.dosingPage=page;
          }
          this.dosingPageInit();
        }
      	
      },
      //
      changeDosing(id,name,type){
        //selectDosingList
        var dosingCount = $('#changid'+id).val();
      	if(type=='prev'){
      		if(dosingCount>1){
            dosingCount--;
            $('#changid'+id).val(dosingCount);
          }
        }
        if(type=='next'){
          dosingCount++;
          $('#changid'+id).val(dosingCount);
        }
      },
      addDosinglist(id,name){
        //selectDosingList
        var _this=this;
        var dosingCount = $('#changid'+id).val();
        var listObj={
        	id:id,
          count:0,
          name:name
        }
        if(_this.selectDosingList.length==0){
          listObj.count=dosingCount;
          _this.selectDosingList.push(listObj);
          
        }else{
        	for(var i=0;i<_this.selectDosingList.length;i++){
        		if(_this.selectDosingList[i]['id']==id){
        			var count =parseInt(_this.selectDosingList[i]['count']);
              count+=parseInt(dosingCount);
              _this.selectDosingList[i]['count']=count;
            }
            
          }
        }
        if (_this.getIsepetition(id)) {
              listObj.count=dosingCount;
              _this.selectDosingList.push(listObj);
        }
        if(_this.selectDosingList.length==0){
          _this.istoackShow=false;
        }else{
          _this.istoackShow=true;
          _this.is_stock=false;
        }
      },
      //移除选中
      delSelectData(id){
      	for(var i=0;i<this.selectDosingList.length;i++){
      		if(this.selectDosingList[i]['id']==id){
            this.selectDosingList.splice(this.getindex(id),1);
          }
        }
        if(this.selectDosingList.length==0){
          this.istoackShow=false;
        }else{
          this.istoackShow=true;
          this.is_stock=false;
        }
      },
      //获取索引
      getindex(id){
      	var result;
        for(var i=0;i<this.selectDosingList.length;i++){
          if(this.selectDosingList[i]['id']==id){
            result=i;
          }
        }
        return result;
      },
      //确认添加
      addDosingConfirm(){
      	if(this.selectDosingList.length==0){
      		this.msgHint('你没有选中任何原料');
      		return;
        }else{
      		this.selsectShow=true;
      		this.close('addgoodsdosing');
        }
      },
      //判断列表中是否有重复数据
      getIsepetition(id){
        var arr = [];
        var result = false;
        for (var j = 0; j < this.selectDosingList.length; j++) {
          if (this.selectDosingList[j]['id'] == id) {
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
      //商品分类新增商品
      addGoodsClassifys(type){
        var _this=this;
        var data,url,is_stock,give;
        if(this.addGoodsName==''){
        	_this.msgHint('商品名称不能为空');
        	return ;
        }
        if(!/^[1-9]{1}\d{0,10}$/.test(this.sales_price.split('.')[0])){
          _this.msgHint('请输入有效的价格');
          return ;
        }
        if(this.dogoodsUnit==0){
          _this.msgHint('请选择商品单位');
          return ;
        }
        if(!/^[1-9]{1}\d{0,10}$/.test(this.warning_store)){
          _this.msgHint('请输入有效的预警库存');
          return ;
        }
        if(this.is_stock){
          is_stock=1;
        }else{
          is_stock=0;
        }
        if(this.give){
          give=1;
        }else{
          give=0;
        }
        if(type=='add'){
          url=_this.port.goodsAdd;
          data={
            cate_id:_this.classifyId,
            goods_name:_this.addGoodsName,
            is_stock:is_stock,
            warning_store:_this.warning_store,
            sales_price:_this.sales_price,
            buy_price:_this.buy_price,
            note:_this.goodsRemark,
            unit:_this.dogoodsUnit,
            give:give,
            dosing:_this.selectDosingList,
          };
        }else{
          url=_this.port.goodsEdit;
          data={
            goods_id:_this.goodsId,
            cate_id:_this.classifyId,
            goods_name:_this.addGoodsName,
            is_stock:is_stock,
            warning_store:_this.warning_store,
            sales_price:_this.sales_price,
            buy_price:_this.buy_price,
            note:_this.goodsRemark,
            unit:_this.dogoodsUnit,
            give:give,
            dosing:_this.selectDosingList,
          };
        }
        
        this.ajax(url,data,'post',function (res) {
        	if(res.code==1){
        		_this.detailClassifyList=[];
        		_this.close('addgoods');
        		_this.close('editgoods');
        		_this.page=1;
            _this.goodsclassifyDetail(_this.changeId,_this.goodsName);
            _this.goodsClassifyInit();
            _this.addGoodsName='';
            _this.is_stock=false;
            _this.warning_store='';
            _this.sales_price='';
            _this.buy_price='';
            _this.goodsRemark='';
            _this.dogoodsUnit=0;
            _this.give=false;
            _this.selectDosingList=[];
          }else{
        		_this.msgHint(res.msg);
          }
        })
      },
      //修改商品分类商品
      editGoods(id){
      	var _this=this;
      	_this.goodsId=id;
      	_this.ajax(_this.port.goodsEdit,{goods_id:_this.goodsId},'get',function (res) {
          if(res.code==1){
          	$('#editgoods').addClass('in');
            $('.bgblack').addClass('in');
            _this.selectDosingList=[];
            _this.addGoodsName=res.data.goods_name;
              _this.dogoodsUnit=res.data.unit;
              _this.buy_price=res.data.buy_price;
              _this.is_stock=res.data.is_stock;
              _this.give=res.data.give;
              _this.sales_price=res.data.sales_price;
              _this.goodsRemark=res.data.note;
              _this.warning_store=res.data.warning_store;
              _this.selectDosingList=res.data.dosing;
              if(res.data.dosing.length!=0 ){
              	_this.is_stock=false;
              	_this.is_storks=false;
              }else{
                _this.is_storks=true;
              	if(res.data.is_stock==1){
                  _this.is_stock=true;
                }else{
                  _this.is_stock=false;
                }
              }
          }
        })
      },
      //添加和修改交班配置
      addHandWork(){
      	var _this=this;
      	if(!/^[1-9]{1}\d{0,10}$/.test(_this.handwork.split('.')[0])){
      		_this.msgHint('请输入正确的数字');
      		return;
        }
        _this.ajax(_this.port.handWork,{value:_this.handwork},'post',function (res) {
        	if(res.code==1){
            _this.close('handworkView');
          }else{
            _this.msgHint(res.msg);
          }
          
        })
      },
      //获取交班配置
      getHandWork(){
        var _this=this;
        _this.ajax(_this.port.handWork,{},'get',function (res) {
          if(res.code==1){
            _this.handwork=res.data.value;
          }
        })
      },
      //初始化管理员列表
      initStaffList(){
      	var _this=this;
      	_this.ajax(_this.port.staffList,{},'get',function (res) {
          if(res.code==1){
          _this.staffList=[];
          _this.staffList=res.data;
          
          }
        })
      },
      //初始化角色列表
      initRoleList(){
      	var _this=this;
      	_this.ajax(_this.port.roleList,{},'get',function (res) {
          if(res.code==1){
          	_this.roleList=[];
          	_this.roleList=res.data;
          }
        })
      },
      //添加管理员
      staff(type){
        var _this=this;
        var url;
        var data;
        if (!/^1(3[0-9]|4[57]|5[0-35-9]|7[013678]|8[0-9])[\d]{8}$/g.test(this.staffPhone)) {
          this.msgHint('请填写正确手机号码');
          return;
        }
        if(this.staffName==''){
          _this.msgHint('员工姓名不能为空');
          return ;
        }
        if(type=='add'){
          if(this.staffPwd==''){
            _this.msgHint('密码不能为空');
            return ;
          }
        }
        
        if(this.staffRole==''){
          _this.msgHint('请选择角色权限');
          return ;
        }
        
        if(type=='add'){
          url=this.port.staffAdd;
          data={
            phone:this.staffPhone,
            password:this.staffPwd,
            role_name:this.staffRole,
            user:this.staffName
          };
        }else{
          url=this.port.staffEdit;
          data={
          	users_id:this.changeId,
            phone:this.staffPhone,
            password:this.staffPwd,
            role_name:this.staffRole,
            user:this.staffName
          }
        }
        this.ajax(url,data,'post',function (res) {
          if(res.code==1){
            _this.staffPhone='';
            _this.staffName='';
            _this.staffPwd='';
            _this.staffRole=0;
            _this.initStaffList();
            _this.close('addUser');
            _this.close('editUser');
          }else{
            _this.msgHint(res.msg);
          }
        })
      },
      //员工详情
      staffDetail(id){
      	var _this=this;
      	_this.changeId=id;
        _this.ajax(_this.port.staffOne,{users_id:id},'get',function (res) {
          if(res.code==1){
            _this.staffInfo=[];
            _this.staffPhone=res.data.phone;
            _this.staffName=res.data.user;
            _this.staffPwd='';
            _this.staffRole=res.data.role_name
            _this.staffInfo=res.data;
            _this.popup('staffinfo',0)
          }
        })
        
      },
    },
    //组件实例完成后
    mounted(){
      var str = window.location.href;
      if(str.indexOf('setting')!=-1){
        $('#navstr').html('设置');
      }
      this.unitInit();
      this.dosingInit();
      this.discountInit();
      this.dosingPageInit();
      this.initStaffList();
      this.initRoleList();
      this.goodsClassifyInit();
      this.rbacInit();
      this.getHandWork();
      this.qrcodeUrl=this.hostUrl+this.port.qrCode;
      this.role = this.getInit['roleData']['setting'];
    }
  }
</script>
<style scoped>
  .bench{
    display:none;
    top:50px;
  }
</style>
