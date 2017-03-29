<template>
  <div>
      <div class="contview">
              <div class="contviewtab">
                <a href="javascript:void(0);" class="current" @click="navclick('')" id="nav">库存管理</a>
                <a href="javascript:void(0);" class="" @click="navclick('2')" id="nav2">入库单查询</a>
                <a href="javascript:void(0);" class="" @click="navclick('3')" id="nav3">出库单查询</a>
                <a href="javascript:void(0);" class="" @click="navclick('4')" id="nav4">入库明细查询</a>
                <a href="javascript:void(0);" class="" @click="navclick('5')" id="nav5">出库明细查询</a>
              
                <div class="cvtab_button fr">
                <a class="btngreen r3px smallbtn chuku fr" href="javascript:void(0)" @click="popup('set')" >新增出库单</a>
                <a class="btngreen r3px smallbtn ruku fr" href="javascript:void(0)" @click="popup('add')">新增入库单</a>
              </div>
        </div>
   <div>
     <!--库存管理-->
      <div class="warehouse bench white-scroll" id="globaltable" style="display: block;">
        
        <div class="globaltable r5px">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>商品编号</td>
              <td width="8%">商品名称</td>
              <td width="8%">库存量</td>
              <td>库存单价(元)</td>
              <td>库存总值(元)</td>
              <td width="10%">操作</td>
            </tr>
            <tr>
              <td>20170301346565</td>
              <td>珍珠奶茶</td>
              <td>1</td>
              <td>0.0</td>
              <td>0.0</td>
              <td><a href="javascript:void(0)" @click=" popup('lookjoin','1')">查看入库</a>
                <a href="javascript:void(0)"  @click=" popup('lookset','1')">查看出库</a></td>
            </tr><tr>
              <td>20170301346594</td>
              <td>刮痧</td>
              <td>1</td>
              <td>0.0</td>
              <td>0.0</td>
              <td><a href="javascript:void(0)" @click=" popup('lookjoin','1')">查看入库</a>
                <a href="javascript:void(0)" @click=" popup('lookset','1')">查看出库</a></td>
            </tr><tr>
              <td>20170301346583</td>
              <td>可乐</td>
              <td>99</td>
              <td>0.0</td>
              <td>0.0</td>
              <td><a href="javascript:void(0)" @click=" popup('lookjoin','1')">查看入库</a>
                <a href="javascript:void(0)" @click=" popup('lookset','1')">查看出库</a></td>
            </tr><tr>
              <td>20170301346574</td>
              <td>中华(硬)</td>
              <td>100</td>
              <td>0.0</td>
              <td>0.0</td>
              <td><a href="javascript:void(0)" @click=" popup('lookjoin','1')">查看入库</a>
                <a href="javascript:void(0)" @click=" popup('lookset','1')">查看出库</a></td>
            </tr>
            <tr>
              <td colspan="9">
                <div class="page clearfix">
                <div class="text">共<b>1</b>页<b>4</b>条记录</div>
                <div class="linklist">
                  <a class="prev" href="javascript:void(0)">&nbsp;</a>
                  <a href="javascript:void(0)" class="current">1</a>
                  
                  
                  
                  
                  <a class="next" href="javascript:void(0)">&nbsp;</a>
                </div>
              </div>
             
            
              </td>
            </tr>
            </tbody></table>
        </div>
      </div>
     
     <!--入库单查询-->
     <div class="warehouse bench white-scroll" id="globaltable2">
       
       <div class="globaltable r5px">
         <table border="0" cellpadding="0" cellspacing="0">
           <tbody><tr>
             <td>入库单号</td>
             <td>入库类型</td>
             <td>入库时间</td>
          
             <td width="10%">操作</td>
           </tr>
           <tr class="table_search">
             <td>--</td>
             <td>--</td>
             <td><input class="calendar ng-untouched ng-pristine ng-valid" type="date"></td>
             <td><a class="search r3px" href="javascript:void 0"></a></td>
           </tr>
           <tr>
             <td>2017030215443962</td>
             <td>采购入库</td>
             <td>2017-03-02 15:44:39</td>
             <td><a href="javascript:void(0)" @click="popup('addDeta')">查看</a></td>
           </tr><tr>
             <td>2017030109373874</td>
             <td>初始化入库</td>
             <td>2017-03-01 09:37:38</td>
             <td><a href="javascript:void(0)" @click="popup('addDeta')">查看</a></td>
           </tr><tr>
             <td>2017030109373812</td>
             <td>初始化入库</td>
             <td>2017-03-01 09:37:38</td>
             <td><a href="javascript:void(0)" @click="popup('addDeta')">查看</a></td>
           </tr>
        
           <tr>
             <td colspan="9">
            
               <div class="page clearfix">
               <div class="text">共<b>1</b>页<b>3</b>条记录</div>
               <div class="linklist">
                 <a class="prev" href="javascript:void(0)">&nbsp;</a>
                 <a href="javascript:void(0)" class="current">1</a>
                 
                 
                 
                 
                 <a class="next" href="javascript:void(0)">&nbsp;</a>
               </div>
             </div>
             
          
             </td>
           </tr>
           </tbody></table>
       </div>
     </div>
     <!--出库单查询-->
     <div class="warehouse bench white-scroll" id="globaltable3">
      
       <div class="globaltable r5px">
         <table border="0" cellpadding="0" cellspacing="0">
           <tbody><tr>
             <td>出库单号</td>
             <td>出库类型</td>
             <td>出库时间</td>
             <td width="10%">操作</td>
           </tr>
           <tr class="table_search">
             <td>--</td>
             <td>--</td>
             <td><input class="calendar ng-untouched ng-pristine ng-valid" type="date"></td>
             <td><a class="search r3px" href="javascript:void 0"></a></td>
           </tr>
           <tr>
             <td>2017030610085437</td>
             <td>销售出库</td>
             <td>2017-03-06 10:08:54</td>
             <td><a href="javascript:void(0)" @click="popup('setDeta')">查看</a></td>
           </tr>
        
           <tr>
             <td colspan="9">
            
               <div class="page clearfix">
               <div class="text">共<b>1</b>页<b>1</b>条记录</div>
               <div class="linklist">
                 <a class="prev" href="javascript:void(0)">&nbsp;</a>
                 <a href="javascript:void(0)" class="current">1</a>
                 
                 
                 
                 
                 <a class="next" href="javascript:void(0)">&nbsp;</a>
               </div>
             </div>
             
          
             </td>
           </tr>
           </tbody></table>
       </div>
     </div>
     <!--入库明细查询-->
     <div class="warehouse bench white-scroll"  id="globaltable4">
       
       <div class="jymxtime dwdtl" style="padding:0px;">
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="BeginTime" type="text">至
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="EndTime" type="text">
         <a class="search r3px">查询</a>
       </div>
       <div class="globaltable r5px">
         <table border="0" cellpadding="0" cellspacing="0">
        
           <tbody><tr>
             <td>入库单号</td>
             <td>商品名称</td>
             <td>类型</td>
             <td>时间</td>
             <td>单价(元)</td>
             <td>数量</td>
             <td>总额(元)</td>
           </tr>
        
           
        
           <tr>
             <td colspan="12">
               <div class="page clearfix">
               <div class="text">共<b>0</b>页<b>0</b>条记录</div>
               <div class="linklist">
                 <a class="prev" href="javascript:void(0)">&nbsp;</a>
                 <a href="javascript:void(0)" class="current">1</a>
                 
                 
                 
                 
                 <a class="next" href="javascript:void(0)">&nbsp;</a>
               </div>
             </div>
         
             </td>
           </tr>
        
        
           </tbody></table>
       </div>
     </div>
     <!--出库明细查询-->
     <div class="warehouse bench white-scroll" id="globaltable5">
       
       <div class="jymxtime dwdtl" style="padding:0px;">
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="BeginTime" type="text">至
         <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="EndTime" type="text">
         <a class="search r3px">查询</a>
       </div>
       <div class="globaltable r5px">
         <table border="0" cellpadding="0" cellspacing="0">
        
           <tbody><tr>
             <td>出库单号</td>
             <td>商品名称</td>
             <td>类型</td>
             <td>时间</td>
             <td>数量</td>
           </tr>
        
           <tr>
             <td>20170306365342</td>
             <td>可乐</td>
             <td>销售出库</td>
             <td>2017-03-06 10:08:54</td>
             <td>1</td>
           </tr>
        
           <tr>
             <td colspan="12">
               <div class="page clearfix">
               <div class="text">共<b>1</b>页<b>1</b>条记录</div>
               <div class="linklist">
                 <a class="prev" href="javascript:void(0)">&nbsp;</a>
                 <a href="javascript:void(0)" class="current">1</a>
                 
                 
                 
                 
                 <a class="next" href="javascript:void(0)">&nbsp;</a>
               </div>
             </div>
            
             </td>
           </tr>
        
        
           </tbody></table>
       </div>
     </div>
     
    </div>
    
      
      
      
      
    </div>
  
    <!--查看入库-->
    <div class="drawerdetail flex flex-v" id="lookjoin">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">【珍珠奶茶】入库记录查询</span>
          <a class="close fr" href="javascript:void(0);" @click="close('lookjoin')" ></a>
        </div>
        <div class="jymxtime dwdtl">
          <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="BeginTime" type="text">至
          <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="EndTime" type="text">
          <a class="search r3px">查询</a>
        </div>
        <div class="theinfo_tbl">
        
          <div class="globaltable r5px">
            <table border="0" cellpadding="0" cellspacing="0">
            
              <tbody><tr>
                <td>入库单号</td>
                <td>类型</td>
                <td>时间</td>
                <td>单价</td>
                <td>数量</td>
                <td>总额</td>
              </tr>
            
              
            
              <tr>
                <td colspan="12">
                  <div class="page clearfix">
                  <div class="text">共<b>0</b>页<b>0</b>条记录</div>
                  <div class="linklist">
                    <a class="prev" href="javascript:void(0)">&nbsp;</a>
                    <a href="javascript:void(0)" class="current">1</a>
                    
                    
                    
                    
                    <a class="next" href="javascript:void(0)">&nbsp;</a>
                  </div>
                </div>
                
                </td>
              </tr>
            
            
              </tbody></table>
          </div>
        </div>
      </div>
  
    </div>
    <!--查看出库-->
    <div class="drawerdetail flex flex-v" id="lookset">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">【珍珠奶茶】出库记录查询</span>
          <a class="close fr" href="javascript:void(0);" @click="close('lookset')"></a>
        </div>
        <div class="jymxtime dwdtl">
          <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="BeginTime" type="text">至
          <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="EndTime" type="text">
          <a class="search r3px">查询</a>
        </div>
        <div class="theinfo_tbl">
        
          <div class="globaltable r5px">
            <table border="0" cellpadding="0" cellspacing="0">
            
              <tbody><tr>
                <td>出库单号</td>
                <td>类型</td>
                <td>时间</td>
                <td>数量</td>
              </tr>
            
              
            
              <tr>
                <td colspan="12">
                  <div class="page clearfix">
                  <div class="text">共<b>0</b>页<b>0</b>条记录</div>
                  <div class="linklist">
                    <a class="prev" href="javascript:void(0)">&nbsp;</a>
                    <a href="javascript:void(0)" class="current">1</a>
                    
                    
                    
                    
                    <a class="next" href="javascript:void(0)">&nbsp;</a>
                  </div>
                </div>
                
                </td>
              </tr>
            
            
              </tbody></table>
          </div>
        </div>
      </div>
  
    </div>
    <!--新增入库单-->
    <div class="viewroom thin-scroll r10px viewspendingroom " style="z-index: 9999"  id="add">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">选择商品</span>
          <a class="close fr" href="javascript:void(0);" @click="close('add')"></a>
        </div>
        <div class="form_detail">
          
          <div class="r5px" style="padding:0 5px 20px; margin-bottom: 20px; border-bottom:#e8e8e8 1px solid; font-weight: bold; color:#666;">
            <table border="0" cellpadding="0" cellspacing="0" class="spending_table">
              <tbody><tr>
                <td style="width: 80px;">入库仓库</td>
                <td style="width: 220px;"><select class="ng-untouched ng-pristine ng-valid">
                  <option value="0">请选择仓库</option>
                  <option value="20170301346421">
                  我的茶楼的仓库
                </option>
                </select>
                </td>
              
                <td style="width: 80px;">入库类型</td>
                <td><select class="ng-untouched ng-pristine ng-valid">
                  <option value="1">采购入库
                  </option>
                  <option value="2">其他入库
                  </option>
                </select>
                </td>
              </tr>
            
              </tbody></table>
          </div>
          <table border="0" cellpadding="0" cellspacing="0" class="spending_table">
            <tbody><tr>
              <td><h3><a class="current">可选商品</a><a>可选原料</a></h3></td>
              <td></td>
              <td><h3>已选</h3></td>
            </tr>
            <tr>
              <td class="gtable" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" class="globaltable">
                  <tbody><tr>
                  
                    <td>名称</td>
                    <td>入库单价</td>
                    <td>数量</td>
                    <td>操作</td>
                  </tr>
                
                  <tr class="table_search">
                  
                    <td><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td>--</td>
                    <td>--</td>
                    <td><a class="search r3px" href="javascript:void 0"></a></td>
                  </tr>
                  <tr>
                  
                    <td>按摩</td>
                    <td style="width: 80px;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td class="quantity"><a class="r3px" href="javascript:void(0)">-</a><input type="text" class="ng-untouched ng-pristine ng-valid"><a class="r3px" href="javascript:void(0)">+</a>
                    </td>
                  
                    <td><a href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr><tr>
                  
                    <td>刮痧</td>
                    <td style="width: 80px;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td class="quantity"><a class="r3px" href="javascript:void(0)">-</a><input type="text" class="ng-untouched ng-pristine ng-valid"><a class="r3px" href="javascript:void(0)">+</a>
                    </td>
                  
                    <td><a href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr><tr>
                  
                    <td>拔罐</td>
                    <td style="width: 80px;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td class="quantity"><a class="r3px" href="javascript:void(0)">-</a><input type="text" class="ng-untouched ng-pristine ng-valid"><a class="r3px" href="javascript:void(0)">+</a>
                    </td>
                  
                    <td><a href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr><tr>
                  
                    <td>瓜子</td>
                    <td style="width: 80px;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td class="quantity"><a class="r3px" href="javascript:void(0)">-</a><input type="text" class="ng-untouched ng-pristine ng-valid"><a class="r3px" href="javascript:void(0)">+</a>
                    </td>
                  
                    <td><a href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr><tr>
                  
                    <td>方便面</td>
                    <td style="width: 80px;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td class="quantity"><a class="r3px" href="javascript:void(0)">-</a><input type="text" class="ng-untouched ng-pristine ng-valid"><a class="r3px" href="javascript:void(0)">+</a>
                    </td>
                  
                    <td><a href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr><tr>
                  
                    <td>扑克牌</td>
                    <td style="width: 80px;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td class="quantity"><a class="r3px" href="javascript:void(0)">-</a><input type="text" class="ng-untouched ng-pristine ng-valid"><a class="r3px" href="javascript:void(0)">+</a>
                    </td>
                  
                    <td><a href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr><tr>
                  
                    <td>红牛</td>
                    <td style="width: 80px;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td class="quantity"><a class="r3px" href="javascript:void(0)">-</a><input type="text" class="ng-untouched ng-pristine ng-valid"><a class="r3px" href="javascript:void(0)">+</a>
                    </td>
                  
                    <td><a href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr><tr>
                  
                    <td>可乐</td>
                    <td style="width: 80px;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td class="quantity"><a class="r3px" href="javascript:void(0)">-</a><input type="text" class="ng-untouched ng-pristine ng-valid"><a class="r3px" href="javascript:void(0)">+</a>
                    </td>
                  
                    <td><a href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr><tr>
                  
                    <td>啤酒</td>
                    <td style="width: 80px;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td class="quantity"><a class="r3px" href="javascript:void(0)">-</a><input type="text" class="ng-untouched ng-pristine ng-valid"><a class="r3px" href="javascript:void(0)">+</a>
                    </td>
                  
                    <td><a href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr><tr>
                  
                    <td>云烟(软)</td>
                    <td style="width: 80px;"><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td class="quantity"><a class="r3px" href="javascript:void(0)">-</a><input type="text" class="ng-untouched ng-pristine ng-valid"><a class="r3px" href="javascript:void(0)">+</a>
                    </td>
                  
                    <td><a href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr>
                  <tr>
                    <td colspan="6">
                    <div class="page clearfix">
                      <div class="text">共<b>3</b>页<b>21</b>条记录</div>
                      <div class="linklist">
                        <a class="prev" href="javascript:void(0)">&nbsp;</a>
                        <a href="javascript:void(0)" class="current">1</a>
                        
                        <a href="javascript:void(0)">2</a>
                        
                        <span>
        <a href="javascript:void(0)">3</a>
        </span>
                        <a class="next" href="javascript:void(0)">&nbsp;</a>
                      </div>
                    </div>
                  
                    </td>
                  </tr>
                  </tbody></table>
              </td>
              <td class="icon" valign="middle"><i></i></td>
              <td class="ctable" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" class="globaltable">
                  <tbody><tr>
                  
                    <td>名称</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>操作</td>
                  </tr>
                
                  
                  </tbody></table>
                <div class="center fs14 c666">请在左侧选择商品。</div>
              </td>
            </tr>
          
          
            
          
            </tbody></table>
          <div class="form_btn clearfix">
            <a class="btngreen fr xinzeng" href="javascript:void(0)">入库</a>
          </div>
        </div>
      </div>
    </div>
    <!--新增出库单-->
    <div _ngcontent-nfu-95="" class="viewroom thin-scroll r10px viewspendingroom" id="set" style="z-index: 9999">
      <div _ngcontent-nfu-95="" class="viewbox r10px form_cont">
        <div _ngcontent-nfu-95="" class="form_cap clearfix">
          <span _ngcontent-nfu-95="" class="fl" >选择商品</span>
          <a  class="close fr"   @click="close('set')"  ></a>
        </div>
        <div _ngcontent-nfu-95="" class="form_detail">
          
          <div _ngcontent-nfu-95="" class="r5px" style="padding:0 5px 20px; margin-bottom: 20px; border-bottom:#e8e8e8 1px solid; font-weight: bold; color:#666;">
            <table _ngcontent-nfu-95="" border="0" cellpadding="0" cellspacing="0">
              <tbody _ngcontent-nfu-95=""><tr _ngcontent-nfu-95="">
                <td _ngcontent-nfu-95="" style="width: 80px;">出库仓库</td>
                <td _ngcontent-nfu-95="" style="width: 220px;"><select _ngcontent-nfu-95="" class="ng-untouched ng-pristine ng-valid">
                  <option _ngcontent-nfu-95="" value="0">请选择仓库</option>
                  <option _ngcontent-nfu-95="" value="20170301346421">
                  我的茶楼的仓库
                </option>
                </select>
                </td>
                <td _ngcontent-nfu-95="" style="width: 80px;">出库类型</td>
                <td _ngcontent-nfu-95=""><select _ngcontent-nfu-95="" class="ng-untouched ng-pristine ng-valid">
                
                  <option _ngcontent-nfu-95="" value="2">自用出库
                  </option>
                  <option _ngcontent-nfu-95="" value="3">其他出库
                  </option>
                </select>
                </td>
              </tr>
              </tbody></table>
          </div>
        
          <table _ngcontent-nfu-95="" border="0" cellpadding="0" cellspacing="0" class="spending_table">
            <tbody _ngcontent-nfu-95=""><tr _ngcontent-nfu-95="">
              <td _ngcontent-nfu-95=""><h3 _ngcontent-nfu-95=""><a _ngcontent-nfu-95="" class="current">可选商品</a>
            
              </h3></td>
              <td _ngcontent-nfu-95=""></td>
              <td _ngcontent-nfu-95=""><h3 _ngcontent-nfu-95="">已选</h3></td>
            </tr>
            <tr _ngcontent-nfu-95="">
              <td _ngcontent-nfu-95="" class="gtable" valign="top">
                <table _ngcontent-nfu-95="" border="0" cellpadding="0" cellspacing="0" class="globaltable">
                  <tbody _ngcontent-nfu-95=""><tr _ngcontent-nfu-95="">
                  
                    <td _ngcontent-nfu-95="">名称</td>
                    <td _ngcontent-nfu-95="">数量</td>
                    <td _ngcontent-nfu-95="">库存</td>
                    <td _ngcontent-nfu-95="">操作</td>
                  </tr>
                
                  <tr _ngcontent-nfu-95="" class="table_search">
                  
                    <td _ngcontent-nfu-95=""><input _ngcontent-nfu-95="" type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td _ngcontent-nfu-95="">--</td>
                    <td _ngcontent-nfu-95="">--</td>
                    <td _ngcontent-nfu-95=""><a _ngcontent-nfu-95="" class="search r3px" href="javascript:void 0"></a></td>
                  </tr>
                  <tr _ngcontent-nfu-95="">
                  
                    <td _ngcontent-nfu-95="" class="left">可乐</td>
                    <td _ngcontent-nfu-95="" class="quantity"><a _ngcontent-nfu-95="" class="r3px" href="javascript:void(0)">-</a><input _ngcontent-nfu-95="" type="text" class="ng-untouched ng-pristine ng-valid"><a _ngcontent-nfu-95="" class="r3px" href="javascript:void(0)">+</a>
                    </td>
                    <td _ngcontent-nfu-95="">99听</td>
                    
                    <td _ngcontent-nfu-95=""><a _ngcontent-nfu-95="" href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr><tr _ngcontent-nfu-95="">
                  
                    <td _ngcontent-nfu-95="" class="left">中华(硬)</td>
                    <td _ngcontent-nfu-95="" class="quantity"><a _ngcontent-nfu-95="" class="r3px" href="javascript:void(0)">-</a><input _ngcontent-nfu-95="" type="text" class="ng-untouched ng-pristine ng-valid"><a _ngcontent-nfu-95="" class="r3px" href="javascript:void(0)">+</a>
                    </td>
                    <td _ngcontent-nfu-95="">100包</td>
                    
                    <td _ngcontent-nfu-95=""><a _ngcontent-nfu-95="" href="javascript:void(0)">添加</a>
                    </td>
                
                  </tr>
                  <tr _ngcontent-nfu-95="">
                    <td _ngcontent-nfu-95="" colspan="6">
                      <div class="page clearfix">
                      <div class="text">共<b>1</b>页<b>2</b>条记录</div>
                      <div class="linklist">
                        <a class="prev" href="javascript:void(0)">&nbsp;</a>
                        <a href="javascript:void(0)" class="current">1</a>
                        
                        
                        
                        
                        <a class="next" href="javascript:void(0)">&nbsp;</a>
                      </div>
                    </div>
                    
                    </td>
                  </tr>
                  </tbody></table>
              </td>
              <td _ngcontent-nfu-95="" class="icon" valign="middle"><i _ngcontent-nfu-95=""></i></td>
              <td _ngcontent-nfu-95="" class="ctable" valign="top">
                <table _ngcontent-nfu-95="" border="0" cellpadding="0" cellspacing="0" class="globaltable">
                  <tbody _ngcontent-nfu-95=""><tr _ngcontent-nfu-95="">
                  
                    <td _ngcontent-nfu-95="">名称</td>
                    <td _ngcontent-nfu-95="">数量</td>
                    <td _ngcontent-nfu-95="">操作</td>
                  </tr>
                
                  
                  </tbody></table>
                <div _ngcontent-nfu-95="" class="center fs14 c666">请在左侧选择商品。</div>
              </td>
            </tr>
          
          
          
            
            </tbody></table>
          <div _ngcontent-nfu-95="" class="form_btn clearfix">
            <a _ngcontent-nfu-95="" class="btngreen fr xinzeng" href="javascript:void(0)">出库</a>
          </div>
        </div>
      </div>
    </div>
    <!--查看入库详情-->
    <div class="viewroom thin-scroll r10px" id="addDeta">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">入库单详情</span>
          <a class="close fr" href="javascript:void(0);" @click="close('addDeta')"></a>
        </div>
        <div class="form_detail">
          <div class="globaltable">
          
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td>入库单号</td>
                <td>商品名称</td>
                <td>入库数量</td>
                <td>入库时间</td>
              </tr>
            
              <tr>
                <td>20170302566791</td>
                <td>珍珠奶茶</td>
                <td>1</td>
                <td>2017-03-02 15:44:39</td>
              </tr><tr>
                <td>20170302566791</td>
                <td>刮痧</td>
                <td>1</td>
                <td>2017-03-02 15:44:39</td>
              </tr>
            
              <tr>
                <td colspan="9">
                  <div class="page clearfix">
                  <div class="text">共<b>1</b>页<b>2</b>条记录</div>
                  <div class="linklist">
                    <a class="prev" href="javascript:void(0)">&nbsp;</a>
                    <a href="javascript:void(0)" class="current">1</a>
                    
                    
                    
                    
                    <a class="next" href="javascript:void(0)">&nbsp;</a>
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
    <div class="viewroom thin-scroll r10px" id="setDeta">
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">出库单详情</span>
          <a class="close fr" href="javascript:void(0);" @click="close('setDeta')"></a>
        </div>
        <div class="form_detail">
          <div class="globaltable">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td>出库单号</td>
                <td>商品名称</td>
                <td>出库数量</td>
                <td>出库时间</td>
              </tr>
            
              <tr>
                <td>20170306365341</td>
                <td>可乐</td>
                <td>1</td>
                <td>2017-03-06 10:08:54</td>
              </tr>
            
              <tr>
                <td colspan="9">
                  <div class="page clearfix">
                  <div class="text">共<b>1</b>页<b>1</b>条记录</div>
                  <div class="linklist">
                    <a class="prev" href="javascript:void(0)">&nbsp;</a>
                    <a href="javascript:void(0)" class="current">1</a>
                    
                    
                    
                    
                    <a class="next" href="javascript:void(0)">&nbsp;</a>
                  </div>
                </div>
                
                </td>
              </tr>
              </tbody></table>
          </div>
        </div>
      </div>
    </div>
    <div class="bgblack "></div>
    
    
    
    
  </div>
  
 
  
  
  
</template>
<script>
  $(function(){
    
  })
  
  
  export default{
    methods: {
//            弹出框显示隐藏
      popup (id,open){
        var id = '#'+id;
        $(id).addClass('in');
        var open =open;
        if(open!=1){
          $('.bgblack').addClass('in');
        }
      },
      close(id){
        var id = '#'+id;
        var open =open;
        $(id).removeClass('in');
        
        
          $('.bgblack').removeClass('in');
       
       
      },
//          是否启动密码
      chelick(){
        $('.password').show();
      },
      chelickHide(){
        $('.password').hide();
      },
//          导航切换
      navclick(id){
        var id = id;
        var bleid =  '#globaltable' + id;
        var nav = '#nav' + id;
        
        $('.bench').hide();
        $('#nav').siblings('.current').removeClass('current').end().removeClass('current');
        $(bleid).show();
        $(nav).addClass('current');
      }
    },
    mounted(){
      $('.money').click(function(){
        $(this).addClass('active').siblings('.money').removeClass('active');
      })
    }
  }

</script>

  <style scoped>
    .bench{
      display:none;
      top:50px;
    }
</style>

