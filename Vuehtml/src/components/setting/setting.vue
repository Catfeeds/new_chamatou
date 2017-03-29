<template>
  <div>
  
    <div class="contview">
      <!--导航-->
      <div class="contviewtab">
        <a href="javascript:void(0);" class="current" @click="navclick('')" id="nav">全部</a>
        <a href="javascript:void(0);" class="" @click="navclick('2')" id="nav2">会员级别</a>
        <a href="javascript:void(0);" class="" @click="navclick('3')" id="nav3">计费规则</a>
        <a href="javascript:void(0);" class="" @click="navclick('4')" id="nav4">散座</a>
        <a href="javascript:void(0);" class="" @click="navclick('5')" id="nav5">包间</a>
        <a href="javascript:void(0);" class="" @click="navclick('6')" id="nav6">单位</a>
        <a href="javascript:void(0);" class="" @click="navclick('7')" id="nav7">商品</a>
        <a href="javascript:void(0);" class="" @click="navclick('8')" id="nav8">原料</a>
        <a href="javascript:void(0);" class="" @click="navclick('9')" id="nav9">角色</a>
        <a href="javascript:void(0);" class="" @click="navclick('0')" id="nav0">员工</a>
      
        <div class="cvtab_button fr">
          <a class="btngreen r3px smallbtn smallxinzeng fr" href="javascript:void(0)" @click="popup('addStores','1')">新增门店</a>
        
          <a class="btngreen r3px smallbtn shopinfobtn fr" href="javascript:void(0)" @click="popup('Stores')">本店信息</a>
      
        </div>
      </div>
      <!--全部-->
      <div class="settings bench white-scroll" style="display: block;" id="globaltable">
        <div>
        <dl class="clearfix settdl">
          <dt class="fl">会员级别</dt>
          
          
          <dd class="fl r5px">
        
          <a href="javascript:void(0);" @click="popup('regular')">
            普通会员
        
        
          </a>
        </dd><dd class="fl r5px">
        
          <a href="javascript:void(0);">
            8折会员
        
        
          </a>
        </dd><dd class="fl r5px">
        
          <a href="javascript:void(0);">
            9折会员
        
        
          </a>
        </dd><dd class="fl r5px">
        
          <a href="javascript:void(0);">
            活动折扣
        
        
          </a>
        </dd>
          <dd class="fl r5px plus"> <a href="javascript:void(0);">+</a></dd>
          
        </dl>
          <form name="addCustomerLevelForm" class="ng-untouched ng-pristine ng-valid">
            <div class="viewsmall form_cont r10px">
              <div class="form_cap clearfix">
                <span class="fl">添加会员等级</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="form_detail">
                
                <div class="form_table">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                      <td>会员等级：</td>
                      <td><input autofocus="true" placeholder="请输入会员等级名称" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                  
                  
                  
                  
                  
                  
                  
                  
                    <tr>
                      <td>商品折扣：</td>
                      <td><input autofocus="true" maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    <tr>
                      <td>包间折扣：</td>
                      <td><input maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    </tbody></table>
                </div>
                <div class="form_btn">
                  <a class="btngreen baocun" href="javascript:void(0);">保存</a>
                </div>
              </div>
            </div>
          </form>
            
        
        
        
         
          <form name="updateCustomerLevelForm" class="ng-untouched ng-pristine ng-valid">
            <div class="viewsmall form_cont r10px">
              <div class="form_cap clearfix">
                <span class="fl">修改会员等级</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="form_detail">
                
                <div class="form_table">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                      <td>会员等级：</td>
                      <td>
                        <input autofocus="true" placeholder="请输入会员等级名称" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                  
                    <tr>
                      <td>商品折扣：</td>
                      <td><input autofocus="true" maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    <tr>
                      <td>包间折扣：</td>
                      <td><input maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    </tbody></table>
                </div>
                <div class="form_btn">
                  <a class="btngreen baocun" href="javascript:void(0);">保存</a>
                </div>
              </div>
            </div>
          </form>
            
          <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">会员等级详细信息</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="theinfo">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>等级编号：</td>
                    <td></td>
                    <td>会员等级：</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>商品折扣：</td>
                    <td>无折扣</td>
                    <td>包间折扣：</td>
                    <td>无折扣</td>
                  </tr>
                  <tr>
                    <td>创建时间：</td>
                    <td colspan="3"></td>
                  </tr>
                
                
                
                
                
                
                
                
                
                
                  </tbody></table>
              </div>
              <div class="theinfo_tbl">
              </div>
            </div>
            <div class="dwdtl_btn">
              <a class="btngreen fr xinzeng" href="javascript:void(0)">新增等级</a>
              <a class="roominfo sidelink fr" href="javascript:void(0)">修改等级</a>
              <div class="clear"></div>
            </div>
          </div>
            <div class="bgblack bgnone"></div>
          <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您确认删除该会员等级吗？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
          
       <dl class="clearfix settdl">
          <dt class="fl">计费规则</dt>
        
          <dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">大包包段</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">大包计时</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">中包包段</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">中包计时</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">小包包段</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">小包计时</a>
        </dd>
          <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
          <dd class="fl r5px"><a href="javascript:void(0);">更多 &gt;&gt;</a></dd>
      
        </dl>
          
          
          
          <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您是否确认执行该操作？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
            
      <dl class="clearfix settdl">
          <dt class="fl">散座分类</dt>
        
          <dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">
            <div class="text">大厅</div>
            <div class="instt">散座 | 4桌</div>
          </a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">
            <div class="text">卡座</div>
            <div class="instt">散座 | 4桌</div>
          </a>
        </dd>
          <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
          
        </dl>
          
          
           <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">详细信息</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="theinfo">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>散座分类名称：</td>
                    <td></td>
                    <td>默认计费方式：</td>
                    <td></td>
                  </tr>
                
                
                
                
                
                
                  </tbody></table>
              </div>
            
              <div class="theinfo_tbl">
              <h3>散座桌台列表</h3>
              <div class="globaltable r5px">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr>
                    <td>桌台名称</td>
                    <td>标准人数</td>
                  
                    <td>操作</td>
                  </tr>
                  
                  <tr>
                    <td colspan="12">
                      
                    </td>
                  </tr>
                
                  </tbody></table>
              </div>
            </div>
            </div>
            <div class="dwdtl_btn">
              <a class="btngreen fr xinzeng" href="javascript:void(0)">新增桌台</a>
              <a class="roominfo sidelink fr" href="javascript:void(0)">修改散座</a>
              <div class="clear"></div>
            </div>
          </div>
          
            <div class="bgblack bgnone"></div>
            
            
            
            <div class="viewwarning r10px">
              <div class="caption clearfix">
                <span class="fl">询问</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="conts">
                <p>您是否确认执行该操作？</p>
                <div class="button">
                  <a href="javascript:void(0);">取消</a>
                  <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
                </div>
              </div>
            </div>
           
           
          
          <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您是否确认执行该操作？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
            
         
        
        <dl class="clearfix settdl">
          <dt class="fl">包间分类</dt>
        
          <dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">
            <div class="text">大包</div>
            <div class="instt">包间 | 3间</div>
          </a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">
            <div class="text">中包</div>
            <div class="instt">包间 | 3间</div>
          </a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">
            <div class="text">小包</div>
            <div class="instt">包间 | 3间</div>
          </a>
        </dd>
          <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
          
        </dl>
          
          
          <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">详细信息</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="theinfo">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>包间分类名称：</td>
                    <td></td>
                    <td>默认计费方式：</td>
                    <td></td>
                  </tr>
                
                
                
                
                
                
                  </tbody></table>
              </div>
            
              <div class="theinfo_tbl">
              <h3>包间列表</h3>
              <div class="globaltable r5px">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr>
                    <td>包间名称</td>
                    <td>标准人数</td>
                  
                    <td>操作</td>
                  </tr>
                  
                  <tr>
                    <td colspan="12">
                      
                    </td>
                  </tr>
                
                  </tbody></table>
              </div>
            </div>
            </div>
            <div class="dwdtl_btn">
              <a class="btngreen fr xinzeng" href="javascript:void(0)">新增包间</a>
              <a class="roominfo sidelink fr" href="javascript:void(0)">修改包间分类</a>
              <div class="clear"></div>
            </div>
          </div>
          
            <div class="bgblack bgnone"></div>
            
            
            <div class="viewwarning r10px">
              <div class="caption clearfix">
                <span class="fl">询问</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="conts">
                <p>您是否确认执行该操作？</p>
                <div class="button">
                  <a href="javascript:void(0);">取消</a>
                  <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
                </div>
              </div>
            </div>
              
          
            
          
          <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您是否确认执行该操作？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
            
         
        <dl class="clearfix settdl">
          <dt class="fl">单位</dt>
        
          
          <dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">次</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">钟</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">袋</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">个</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">泡</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">份</a>
        </dd>
          <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
          <dd class="fl r5px"><a href="javascript:void(0);">更多 &gt;&gt;</a></dd>
        </dl>
          <form name="updateUnitForm" class="ng-untouched ng-pristine ng-valid">
            <div class="viewsmall form_cont r10px">
              <div class="form_cap clearfix">
                <span class="fl">修改计量单位</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="form_detail">
                
                <div class="form_table">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                      <td>名称：</td>
                      <td><input autofocus="true" placeholder="请输入计量单位名称" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    </tbody></table>
                </div>
                
                <div class="form_prompt">用于商品、原材料的计量单位。</div>
                <div class="form_btn">
                  <a class="btngreen baocun" href="javascript:void(0);">保存</a>
                </div>
              </div>
            </div>
          </form>
            
        
        
        
          <form name="addUnitForm" class="ng-untouched ng-pristine ng-valid">
            <div class="viewsmall form_cont r10px">
              <div class="form_cap clearfix">
                <span class="fl">添加计量单位</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="form_detail">
                
                <div class="form_table">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                      <td>名称：</td>
                      <td><input autofocus="true" placeholder="请输入计量单位名称" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    </tbody></table>
                </div>
                
                <div class="form_prompt">用于商品、原材料的计量单位。</div>
                <div class="form_btn">
                  <a class="btngreen baocun" href="javascript:void(0);">保存</a>
                </div>
              </div>
            </div>
          </form>
            
        
        
        
         <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">计量单位详细信息</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="theinfo">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>单位编号：</td>
                    <td></td>
                    <td>单位名称：</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>创建时间：</td>
                    <td colspan="3"></td>
                  </tr>
                  </tbody></table>
              </div>
              <div class="theinfo_tbl">
              </div>
            </div>
            <div class="dwdtl_btn">
              <a class="btngreen fr xinzeng" href="javascript:void(0)">新增单位</a>
              <a class="roominfo sidelink fr" href="javascript:void(0)">修改单位</a>
              <div class="clear"></div>
            </div>
          </div>
            <div class="bgblack bgnone"></div>
         
          <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您是否确认执行该操作？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
            
          
       <dl class="clearfix settdl">
          <dt class="fl">商品分类</dt>
        
          <dd class="fl r5px">
          
          <a href="javascript:void(0);">
          
            <div class="text"> 保健/养生</div>
            <div class="instt">3种商品</div>
            
          </a>
        </dd><dd class="fl r5px">
          
          <a href="javascript:void(0);">
          
            <div class="text"> 小商品</div>
            <div class="instt">3种商品</div>
            
          </a>
        </dd><dd class="fl r5px">
          
          <a href="javascript:void(0);">
          
            <div class="text"> 饮料/酒水</div>
            <div class="instt">3种商品</div>
            
          </a>
        </dd><dd class="fl r5px">
          
          <a href="javascript:void(0);">
          
            <div class="text"> 香烟</div>
            <div class="instt">3种商品</div>
            
          </a>
        </dd><dd class="fl r5px">
          
          <a href="javascript:void(0);">
          
            <div class="text"> 简餐</div>
            <div class="instt">3种商品</div>
            
          </a>
        </dd><dd class="fl r5px">
          
          <a href="javascript:void(0);">
          
            <div class="text"> 茶水/咖啡</div>
            <div class="instt">6种商品</div>
            
          </a>
        </dd>
          <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
          
        </dl>
          
          
         <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">【饮料/酒水】所有商品</span>
                <a class="close fr" href="javascript:void(0);"></a>
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
                    <tr class="table_search">
                      <td><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    
                      <td>--</td>
                      <td>--</td>
                      <td>--</td>
                    
                      <td><a class="search r3px" href="javascript:void 0"></a></td>
                    </tr>
                  
                    <tr>
                      <td>红牛</td>
                    
                      <td>听</td>
                      <td>10</td>
                      <td>否</td>
                    
                      <td> <a href="javascript:void(0)">修改</a>
                        <a href="javascript:void(0)">删除</a></td>
                  
                    </tr><tr>
                      <td>可乐</td>
                    
                      <td>听</td>
                      <td>10</td>
                      <td>是</td>
                    
                      <td> <a href="javascript:void(0)">修改</a>
                        <a href="javascript:void(0)">删除</a></td>
                  
                    </tr><tr>
                      <td>啤酒</td>
                    
                      <td>瓶</td>
                      <td>10</td>
                      <td>否</td>
                    
                      <td> <a href="javascript:void(0)">修改</a>
                        <a href="javascript:void(0)">删除</a></td>
                  
                    </tr>
                  
                    <tr>
                      <td colspan="12">
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
            </div>
            <div class="dwdtl_btn">
            
              <a class="btngreen xinzeng fr" href="javascript:void(0)">新增商品</a>
              <a class="roominfo sidelink fr" href="javascript:void(0)">修改分类</a>
            </div>
          </div>
            <div class="bgblack bgnone"></div>
            
            
           <div class="viewwarning r10px">
              <div class="caption clearfix">
                <span class="fl">询问</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="conts">
                <p>您确认要删除吗？</p>
                <div class="button">
                  <a href="javascript:void(0);">取消</a>
                  <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
                </div>
              </div>
            </div>
              
           <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您确认要删除吗？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
            
          
      
      
       
        <dl class="clearfix settdl">
          <dt class="fl">原料分类</dt>
          
          <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
          
        </dl>
          
          <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">商品列表</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
            
              <div class="theinfo_tbl">
              
                <div class="globaltable r5px">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                    
                      <td>原料名</td><td>单位</td><td>操作</td></tr>
                    <tr class="table_search">
                    
                      <td><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                      <td>--</td>
                    
                      <td><a class="search r3px" href="javascript:void 0"></a></td>
                    </tr>
                    
                    <tr>
                      <td colspan="12">
                        
                      </td>
                    </tr>
                    </tbody></table>
                </div>
              </div>
            </div>
            <div class="dwdtl_btn">
              <a class="btngreen xinzeng fr" href="javascript:void(0)">新增原料</a>
              <a class="roominfo sidelink fr" href="javascript:void(0)">修改原料分类</a>
          
            </div>
          </div>
            <div class="bgblack bgnone"></div>
          
            
            
          
            <div class="viewwarning r10px">
              <div class="caption clearfix">
                <span class="fl">询问</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="conts">
                <p>您确认要删除吗？</p>
                <div class="button">
                  <a href="javascript:void(0);">取消</a>
                  <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
                </div>
              </div>
            </div>
            
          <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您确认要删除吗？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
           
       
      
      
        
        <dl class="clearfix settdl">
          <dt class="fl">角色及权限</dt>
        
         <dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">经理</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">服务员</a>
        </dd><dd class="fl r5px">
          <i class="delete">删除</i>
          <a href="javascript:void(0);">收银员</a>
        </dd><dd class="fl r5px">
          
          <a href="javascript:void(0);">系统管理员</a>
        </dd>
          <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
          
        </dl>
          
          
           <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">角色详细信息</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="theinfo">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>角色名称：</td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  </tbody></table>
                <table border="1" cellpadding="0" cellspacing="0" class="qx_table">
                  <tbody>
                
                  </tbody></table>
              </div>
              <div class="theinfo_tbl">
              </div>
            </div>
            <div class="dwdtl_btn">
              <a class="btngreen fr xinzeng" href="javascript:void(0)">新增角色</a>
              
              <div class="clear"></div>
            </div>
          </div>
          
            <div class="bgblack bgnone"></div>
         
          <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您是否确认执行该操作？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
           
      
        <dl class="clearfix settdl">
          <dt class="fl">员工</dt>
        
          <dd class="fl r5px">
          
          <a href="javascript:void(0);">
            <div class="text">琳琳</div>
            <div class="instt">系统管理员</div>
          </a>
        </dd>
          <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
          
        </dl>
          
          
           <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">员工详细信息</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="theinfo">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>员工名称：</td>
                    <td></td>
                    <td>手机：</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>角色：</td>
                    <td></td>
                    <td> 创建时间：</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>性别：</td>
                    <td></td>
                    <td> 身份证号码：</td>
                    <td></td>
                  </tr>
                
                  </tbody></table>
              </div>
              <div class="theinfo_tbl">
              </div>
            </div>
            <div class="dwdtl_btn">
              <a class="btngreen fr xinzeng" href="javascript:void(0)">新增员工</a>
              
              <div class="clear"></div>
            </div>
          </div>
          
            <div class="bgblack bgnone"></div>
          
          <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您是否确认执行该操作？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
          <dl class="clearfix settdl">
          <dt class="fl">其他设置</dt>
        
        
          <dd class="fl r5px">
          <a href="javascript:void(0);">手动优惠幅度设置</a></dd>
          <dd class="fl r5px">
          <a href="javascript:void(0);">授权密码</a></dd>
          <dd class="fl r5px">
          <a href="javascript:void(0);">云打印机</a></dd>
          <dd class="fl r5px">
          <a href="javascript:void(0);">
            <div class="text">日结时间</div>
            <div class="instt">当日0点0分-次日0点0分</div>
          </a>
        </dd>
        </dl>
        <div class="viewsmall form_cont r10px">
            <div class="form_cap clearfix">
              <span class="fl">设置授权密码</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="form_detail">
              
              <div class="form_table">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>授权密码：</td>
                    <td><input placeholder="请输入授权密码" type="password" class="ng-untouched ng-pristine ng-valid">
                    </td>
                    <td colspan="2" style="text-align:left; padding:0;"></td>
                  </tr>
                  <tr>
                    <td>再次输入：</td>
                    <td><input placeholder="请再次输入授权密码" type="password" class="ng-untouched ng-pristine ng-valid">
                    </td>
                    <td colspan="2" style="text-align:left; padding:0;"></td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  </tbody></table>
              </div>
              <div class="form_prompt">用于取消点单、撤销点单商品</div>
              <div class="form_btn">
                <a class="btngreen baocun" href="javascript:void(0);">保存</a>
              </div>
            </div>
          </div>
            
        
        
        
        <div class="drawerdetail flex flex-v ">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">会员积分规则详情</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="theinfo">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>每消费：</td>
                    <td>元</td>
                    <td>获得积分：</td>
                    <td>分</td>
                  </tr>
                  <tr>
                    <td>每充值：</td>
                    <td>元</td>
                    <td>获得积分：</td>
                    <td>分</td>
                  </tr>
                  </tbody></table>
              </div>
              <div class="theinfo_tbl">
              </div>
            </div>
            <div class="dwdtl_btn">
              <a class="btngreen fr xinzeng" href="javascript:void(0)">修改规则</a>
              <div class="clear"></div>
            </div>
          </div>
            <div class="bgblack bgnone"></div>
          
            <div class="viewroom thin-scroll r10px">
              <div class="viewbox r10px form_cont">
                <div class="form_cap clearfix">
                  <span class="fl">设置积分规则</span>
                  <a class="close fr" href="javascript:void(0);"></a>
                </div>
                <div class="form_detail">
                  <div class="form_table">
                    <table border="0" cellpadding="0" cellspacing="0">
                      <tbody><tr class="newdesk">
                        <td>每消费：<input class="shorterbox ng-untouched ng-pristine ng-invalid" placeholder="消费金额" type="text">积<input class="shorterbox ng-untouched ng-pristine ng-invalid" placeholder="积分" type="text">分
                        </td>
                      </tr>
                      <tr class="newdesk">
                        <td>每充值：<input class="shorterbox ng-untouched ng-pristine ng-invalid" placeholder="充值金额" type="text">积<input class="shorterbox ng-untouched ng-pristine ng-invalid" placeholder="积分" type="text">分
                        </td>
                      </tr>
                      </tbody></table>
                  </div>
                  <div class="form_btn">
                    <a class="btngreen baocun" href="javascript:void(0);">保存</a>
                  </div>
                </div>
              </div>
            </div>
          
            
          <form name="addConsumeBillDiscountRangeForm" class="ng-untouched ng-pristine ng-valid">
            <div class="viewsmall form_cont r10px">
              <div class="form_cap clearfix">
                <span class="fl">添加手动优惠区间</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="form_detail">
                
                <div class="form_table">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                      <td>起始值：</td>
                      <td><input autofocus="true" placeholder="请输入区间起始值（元）" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    <tr>
                      <td>结束值：</td>
                      <td><input autofocus="true" placeholder="请输入区间结束值（元）" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    <tr>
                      <td>优惠额度：</td>
                      <td><input autofocus="true" placeholder="请输入最大优惠额度（元）" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    </tbody></table>
                </div>
                <div class="form_btn">
                  <a class="btngreen baocun" href="javascript:void(0);">保存</a>
                </div>
              </div>
            </div>
          </form>
            
        
        
        
         <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix mt10">
                <span class="fl">消费单-手动优惠幅度详情</span>
                <a class="close fr" href="javascript:void(0);"></a>
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
                    
                    <tr>
                      <td>1001.0元</td>
                      <td>3000.0元</td>
                      <td>30.0元</td>
                      <td> <a href="javascript:void(0);">修改</a> <a href="javascript:void(0);">删除</a></td>
                    </tr><tr>
                      <td>1.0元</td>
                      <td>1000.0元</td>
                      <td>10.0元</td>
                      <td> <a href="javascript:void(0);">修改</a> <a href="javascript:void(0);">删除</a></td>
                    </tr>
                    </tbody></table>
                </div>
              </div>
            </div>
            <div class="dwdtl_btn">
              <a class="btngreen fr xinzeng" href="javascript:void(0);">新增区间</a>
              <div class="clear"></div>
            </div>
          </div>
            <div class="bgblack bgnone"></div>
            <div class="viewwarning r10px">
              <div class="caption clearfix">
                <span class="fl">询问</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="conts">
                <p>您是否确认执行该操作？</p>
                <div class="button">
                  <a href="javascript:void(0);">取消</a>
                  <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
                </div>
              </div>
            </div>
            <form name="updateConsumeBillDiscountRangeForm" class="ng-untouched ng-pristine ng-valid">
            <div class="viewsmall form_cont r10px">
              <div class="form_cap clearfix">
                <span class="fl">添加手动优惠区间</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="form_detail">
                
                <div class="form_table">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                      <td>起始值：</td>
                      <td><input autofocus="true" placeholder="请输入区间起始值（元）" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    <tr>
                      <td>结束值：</td>
                      <td><input autofocus="true" placeholder="请输入区间结束值（元）" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    <tr>
                      <td>优惠额度：</td>
                      <td><input autofocus="true" placeholder="请输入最大优惠额度（元）" type="text" class="ng-untouched ng-pristine ng-invalid">
                      </td>
                      <td colspan="2" style="text-align:left; padding:0;"></td>
                    </tr>
                    </tbody></table>
                </div>
                <div class="form_btn">
                  <a class="btngreen baocun" href="javascript:void(0);">保存</a>
                </div>
              </div>
            </div>
          </form>
            
        
        
        
          <div class="viewroom thin-scroll r10px">
            <div class="viewbox r10px form_cont exchange">
              <div class="form_cap clearfix">
                <span class="fl">设置云打印机</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="form_detail">
                
                <div class="exchange_tab">
                  <span class="current">结账台</span>
                  <span>后厨</span>
                  <span>其他A</span>
                  <span>其他B</span>
                  <span>其他C</span>
                  <span>其他D</span>
                </div>
                <div>
              
                <div class="form_table mt10">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tbody><tr>
                      <td>设备型号：</td>
                      <td><input type="text" class="ng-untouched ng-pristine ng-valid">
                      </td>
                      <td>终端号：</td>
                      <td><input type="text" class="ng-untouched ng-pristine ng-valid">
                      </td>
                    </tr>
                    <tr>
                      <td>密钥：</td>
                      <td><input type="text" class="ng-untouched ng-pristine ng-valid">
                      </td>
                      <td>是否启用：</td>
                      <td>
                        <label><input type="radio" value="true" class="ng-untouched ng-pristine ng-valid">是</label>
                        <label><input type="radio" value="false" class="ng-untouched ng-pristine ng-valid">否</label>
                      </td>
                    </tr>
                    </tbody></table>
                </div>
              </div>
                
                
                
                
                
              
                <div class="form_btn">
                  <a class="btngreen baocun" href="javascript:void(0);">保存</a>
                </div>
              </div>
            </div>
          </div>
            
            
         <div class="drawerdetail flex flex-v">
            <div class="dwdtl-scroll white-scroll flex-1">
              <div class="dwdtl_name clearfix">
                <span class="fl">云打印机详细信息</span>
                <a class="close fr" href="javascript:void(0);"></a>
              </div>
              <div class="theinfo">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>创建时间：</td>
                    <td>0001-01-01 00:00:00</td>
                    <td>状态：</td>
                    <td>停用</td>
                  </tr>
                  </tbody></table>
              </div>
              
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
            </div>
            <div class="dwdtl_btn">
              <a class="btngreen fr xinzeng" href="javascript:void(0)">设置打印机</a>
              <div class="clear"></div>
            </div>
          </div>
            <div class="bgblack bgnone"></div>
           <div class="viewroom thin-scroll r10px">
              <div class="viewbox r10px form_cont exchange">
                <div class="form_cap clearfix">
                  <span class="fl">设置云打印机</span>
                  <a class="close fr" href="javascript:void(0);"></a>
                </div>
                <div class="form_detail">
                  
                  <div class="exchange_tab">
                    <span class="current">结账台</span>
                    <span>后厨</span>
                    <span>其他A</span>
                    <span>其他B</span>
                    <span>其他C</span>
                    <span>其他D</span>
                  </div>
                  <div>
                
                  <div class="form_table mt10">
                    <table border="0" cellpadding="0" cellspacing="0">
                      <tbody><tr>
                        <td>设备型号：</td>
                        <td><input type="text" class="ng-untouched ng-pristine ng-valid">
                        </td>
                        <td>终端号：</td>
                        <td><input type="text" class="ng-untouched ng-pristine ng-valid">
                        </td>
                      </tr>
                      <tr>
                        <td>密钥：</td>
                        <td><input type="text" class="ng-untouched ng-pristine ng-valid">
                        </td>
                        <td>是否启用：</td>
                        <td>
                          <label><input type="radio" value="true" class="ng-untouched ng-pristine ng-valid">是</label>
                          <label><input type="radio" value="false" class="ng-untouched ng-pristine ng-valid">否</label>
                        </td>
                      </tr>
                      </tbody></table>
                  </div>
                </div>
                  
                  
                  
                  
                  
                
                  <div class="form_btn">
                    <a class="btngreen baocun" href="javascript:void(0);">保存</a>
                  </div>
                </div>
              </div>
            </div>
              
              
            <div class="viewsmall form_cont r10px">
            <div class="form_cap clearfix">
              <span class="fl">设置日结时间</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="form_detail">
              
              <div class="form_table">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>当日</td>
                    <td>
                      <select class="shorterbox ng-untouched ng-pristine ng-valid">
                        <option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option>
                      </select>&nbsp;点&nbsp;
                      <select class="shorterbox ng-untouched ng-pristine ng-valid">
                        <option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option><option>31</option><option>32</option><option>33</option><option>34</option><option>35</option><option>36</option><option>37</option><option>38</option><option>39</option><option>40</option><option>41</option><option>42</option><option>43</option><option>44</option><option>45</option><option>46</option><option>47</option><option>48</option><option>49</option><option>50</option><option>51</option><option>52</option><option>53</option><option>54</option><option>55</option><option>56</option><option>57</option><option>58</option><option>59</option>
                      </select>&nbsp;分
                    </td>
                  </tr>
                  <tr>
                    <td>至次日</td>
                    <td><b>0</b>&nbsp;点&nbsp;<b>0</b>&nbsp;分</td>
                  </tr>
                  </tbody></table>
              </div>
              <div class="form_prompt">每日的营业额、销量排行均以此日结算区间统计。</div>
              <div class="form_btn">
                <a class="btngreen baocun" href="javascript:void(0);">保存</a>
              </div>
            </div>
          </div>
            
            
        
        
          
      </div>
        
        
        
        
      </div>
      <!--会员级别-->
      <div class="settings bench white-scroll" id="globaltable2">
         
         <div>
         <dl class="clearfix settdl">
        <dt class="fl">会员级别</dt>
         
         
         <dd class="fl r5px">
    
        <a href="javascript:void(0);" @click="popup('regular')">
          普通会员
    
    
        </a>
      </dd><dd class="fl r5px">
    
        <a href="javascript:void(0);">
          8折会员
    
    
        </a>
      </dd><dd class="fl r5px">
    
        <a href="javascript:void(0);">
          9折会员
    
    
        </a>
      </dd><dd class="fl r5px">
    
        <a href="javascript:void(0);">
          活动折扣
    
    
        </a>
      </dd>
        <dd class="fl r5px plus"> <a href="javascript:void(0);">+</a></dd>
         
      </dl>
        <form name="addCustomerLevelForm" class="ng-untouched ng-pristine ng-valid">
          <div class="viewsmall form_cont r10px">
            <div class="form_cap clearfix">
              <span class="fl">添加会员等级</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="form_detail">
               
              <div class="form_table">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>会员等级：</td>
                    <td><input autofocus="true" placeholder="请输入会员等级名称" type="text" class="ng-untouched ng-pristine ng-invalid">
                    </td>
                    <td colspan="2" style="text-align:left; padding:0;"></td>
                  </tr>
              
              
              
              
              
              
              
              
                  <tr>
                    <td>商品折扣：</td>
                    <td><input autofocus="true" maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-invalid">
                    </td>
                    <td colspan="2" style="text-align:left; padding:0;"></td>
                  </tr>
                  <tr>
                    <td>包间折扣：</td>
                    <td><input maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-invalid">
                    </td>
                    <td colspan="2" style="text-align:left; padding:0;"></td>
                  </tr>
                  </tbody></table>
              </div>
              <div class="form_btn">
                <a class="btngreen baocun" href="javascript:void(0);">保存</a>
              </div>
            </div>
          </div>
        </form>
           
    
    
    
         
         <form name="updateCustomerLevelForm" class="ng-untouched ng-pristine ng-valid">
          <div class="viewsmall form_cont r10px">
            <div class="form_cap clearfix">
              <span class="fl">修改会员等级</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="form_detail">
               
              <div class="form_table">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>会员等级：</td>
                    <td>
                      <input autofocus="true" placeholder="请输入会员等级名称" type="text" class="ng-untouched ng-pristine ng-invalid">
                    </td>
                    <td colspan="2" style="text-align:left; padding:0;"></td>
                  </tr>
              
                  <tr>
                    <td>商品折扣：</td>
                    <td><input autofocus="true" maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-invalid">
                    </td>
                    <td colspan="2" style="text-align:left; padding:0;"></td>
                  </tr>
                  <tr>
                    <td>包间折扣：</td>
                    <td><input maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-invalid">
                    </td>
                    <td colspan="2" style="text-align:left; padding:0;"></td>
                  </tr>
                  </tbody></table>
              </div>
              <div class="form_btn">
                <a class="btngreen baocun" href="javascript:void(0);">保存</a>
              </div>
            </div>
          </div>
        </form>
           
         
          <div class="drawerdetail flex flex-v">
          <div class="dwdtl-scroll white-scroll flex-1">
            <div class="dwdtl_name clearfix">
              <span class="fl">会员等级详细信息</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="theinfo">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td>等级编号：</td>
                  <td></td>
                  <td>会员等级：</td>
                  <td></td>
                </tr>
                <tr>
                  <td>商品折扣：</td>
                  <td>无折扣</td>
                  <td>包间折扣：</td>
                  <td>无折扣</td>
                </tr>
                <tr>
                  <td>创建时间：</td>
                  <td colspan="3"></td>
                </tr>
            
            
            
            
            
            
            
            
            
            
                </tbody></table>
            </div>
            <div class="theinfo_tbl">
            </div>
          </div>
          <div class="dwdtl_btn">
             <a class="btngreen fr xinzeng" href="javascript:void(0)">新增等级</a>
             <a class="roominfo sidelink fr" href="javascript:void(0)">修改等级</a>
            <div class="clear"></div>
          </div>
        </div>
          <div class="bgblack bgnone"></div>
         
         <div class="viewwarning r10px">
          <div class="caption clearfix">
            <span class="fl">询问</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="conts">
            <p>您确认删除该会员等级吗？</p>
            <div class="button">
              <a href="javascript:void(0);">取消</a>
              <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
            </div>
          </div>
        </div>
           
         
       
         
         
         
    
         
    
         
    
         
         
    
         
  
      </div>
         
         
         
      </div>
      <!--计费规则-->
      <div class="settings bench white-scroll"  id="globaltable3">
         
         <div>
         
           <dl class="clearfix settdl">
        <dt class="fl">计费规则</dt>
    
         <dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">大包包段</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">大包计时</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">中包包段</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">中包计时</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">小包包段</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">小包计时</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">散座</a>
      </dd>
         <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
         
  
      </dl>
         
         
         
         <div class="viewwarning r10px">
          <div class="caption clearfix">
            <span class="fl">询问</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="conts">
            <p>您是否确认执行该操作？</p>
            <div class="button">
              <a href="javascript:void(0);">取消</a>
              <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
            </div>
          </div>
        </div>
           
         
  
       
         
         
    
         
    
         
    
         
         
    
         
  
      </div>
         
         
         
      </div>
      <!--散座-->
      <div class="settings bench white-scroll"  id="globaltable4">
         
         <div>
         
         
           <dl class="clearfix settdl">
        <dt class="fl">散座分类</dt>
    
         <dd class="fl r5px">
        <i class="delete">删除</i>
        <a href="javascript:void(0);">
          <div class="text">大厅</div>
          <div class="instt">散座 | 4桌</div>
        </a>
      </dd><dd class="fl r5px">
        <i class="delete">删除</i>
        <a href="javascript:void(0);">
          <div class="text">卡座</div>
          <div class="instt">散座 | 4桌</div>
        </a>
      </dd>
         <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
         
      </dl>
         
         
           <div class="drawerdetail flex flex-v">
          <div class="dwdtl-scroll white-scroll flex-1">
            <div class="dwdtl_name clearfix">
              <span class="fl">详细信息</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="theinfo">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td>散座分类名称：</td>
                  <td></td>
                  <td>默认计费方式：</td>
                  <td></td>
                </tr>
            
            
            
            
            
            
                </tbody></table>
            </div>
        
             <div class="theinfo_tbl">
            <h3>散座桌台列表</h3>
            <div class="globaltable r5px">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody>
                <tr>
                  <td>桌台名称</td>
                  <td>标准人数</td>
              
                  <td>操作</td>
                </tr>
                 
                <tr>
                  <td colspan="12">
                     
                  </td>
                </tr>
            
                </tbody></table>
            </div>
          </div>
          </div>
          <div class="dwdtl_btn">
             <a class="btngreen fr xinzeng" href="javascript:void(0)">新增桌台</a>
             <a class="roominfo sidelink fr" href="javascript:void(0)">修改散座</a>
            <div class="clear"></div>
          </div>
        </div>
      
          <div class="bgblack bgnone"></div>
           
           
           
           <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您是否确认执行该操作？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
             
           
         
         <div class="viewwarning r10px">
          <div class="caption clearfix">
            <span class="fl">询问</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="conts">
            <p>您是否确认执行该操作？</p>
            <div class="button">
              <a href="javascript:void(0);">取消</a>
              <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
            </div>
          </div>
        </div>
           
         
       
         
    
         
    
         
    
         
         
    
         
  
      </div>
         
         
         
      </div>
      <!--包间-->
      <div class="settings bench white-scroll"  id="globaltable5">
         
         <div>
         
         
         
           <dl class="clearfix settdl">
        <dt class="fl">包间分类</dt>
    
         <dd class="fl r5px">
        <i class="delete">删除</i>
        <a href="javascript:void(0);">
          <div class="text">大包</div>
          <div class="instt">包间 | 3间</div>
        </a>
      </dd><dd class="fl r5px">
        <i class="delete">删除</i>
        <a href="javascript:void(0);">
          <div class="text">中包</div>
          <div class="instt">包间 | 3间</div>
        </a>
      </dd><dd class="fl r5px">
        <i class="delete">删除</i>
        <a href="javascript:void(0);">
          <div class="text">小包</div>
          <div class="instt">包间 | 3间</div>
        </a>
      </dd>
         <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
         
      </dl>
         
         
           <div class="drawerdetail flex flex-v">
          <div class="dwdtl-scroll white-scroll flex-1">
            <div class="dwdtl_name clearfix">
              <span class="fl">详细信息</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="theinfo">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td>包间分类名称：</td>
                  <td></td>
                  <td>默认计费方式：</td>
                  <td></td>
                </tr>
            
            
            
            
            
            
                </tbody></table>
            </div>
        
             <div class="theinfo_tbl">
            <h3>包间列表</h3>
            <div class="globaltable r5px">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody>
                <tr>
                  <td>包间名称</td>
                  <td>标准人数</td>
              
                  <td>操作</td>
                </tr>
                 
                <tr>
                  <td colspan="12">
                     
                  </td>
                </tr>
            
                </tbody></table>
            </div>
          </div>
          </div>
          <div class="dwdtl_btn">
             <a class="btngreen fr xinzeng" href="javascript:void(0)">新增包间</a>
             <a class="roominfo sidelink fr" href="javascript:void(0)">修改包间分类</a>
            <div class="clear"></div>
          </div>
        </div>
      
          <div class="bgblack bgnone"></div>
           
           
           <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您是否确认执行该操作？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
             
           
           
        </detail-private-room>
         <div class="viewwarning r10px">
          <div class="caption clearfix">
            <span class="fl">询问</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="conts">
            <p>您是否确认执行该操作？</p>
            <div class="button">
              <a href="javascript:void(0);">取消</a>
              <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
            </div>
          </div>
        </div>
           
         
      </private-room-topn>
    
         
    
         
    
         
         
    
         
  
      </div>
         
         
         
      </div>
      <!--单位-->
      <div class="settings bench white-scroll"  id="globaltable6">
         
         <div>
         
         
         
         
    
           <dl class="clearfix settdl">
        <dt class="fl">单位</dt>
    
         
         <dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">次</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">钟</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">袋</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">个</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">泡</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">份</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">副</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">桶</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">听</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">包</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">瓶</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">壶</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">杯</a>
      </dd>
         <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
         
      </dl>
         <form name="updateUnitForm" class="ng-untouched ng-pristine ng-valid">
          <div class="viewsmall form_cont r10px">
            <div class="form_cap clearfix">
              <span class="fl">修改计量单位</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="form_detail">
               
              <div class="form_table">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>名称：</td>
                    <td><input autofocus="true" placeholder="请输入计量单位名称" type="text" class="ng-untouched ng-pristine ng-invalid">
                    </td>
                    <td colspan="2" style="text-align:left; padding:0;"></td>
                  </tr>
                  </tbody></table>
              </div>
               
              <div class="form_prompt">用于商品、原材料的计量单位。</div>
              <div class="form_btn">
                <a class="btngreen baocun" href="javascript:void(0);">保存</a>
              </div>
            </div>
          </div>
        </form>
           
    
    
    
        </setup-unit-update>
         <form name="addUnitForm" class="ng-untouched ng-pristine ng-valid">
          <div class="viewsmall form_cont r10px">
            <div class="form_cap clearfix">
              <span class="fl">添加计量单位</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="form_detail">
               
              <div class="form_table">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                    <td>名称：</td>
                    <td><input autofocus="true" placeholder="请输入计量单位名称" type="text" class="ng-untouched ng-pristine ng-invalid">
                    </td>
                    <td colspan="2" style="text-align:left; padding:0;"></td>
                  </tr>
                  </tbody></table>
              </div>
               
              <div class="form_prompt">用于商品、原材料的计量单位。</div>
              <div class="form_btn">
                <a class="btngreen baocun" href="javascript:void(0);">保存</a>
              </div>
            </div>
          </div>
        </form>
           
    
    
    
        </setup-unit-add>
          <div class="drawerdetail flex flex-v">
          <div class="dwdtl-scroll white-scroll flex-1">
            <div class="dwdtl_name clearfix">
              <span class="fl">计量单位详细信息</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="theinfo">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td>单位编号：</td>
                  <td></td>
                  <td>单位名称：</td>
                  <td></td>
                </tr>
                <tr>
                  <td>创建时间：</td>
                  <td colspan="3"></td>
                </tr>
                </tbody></table>
            </div>
            <div class="theinfo_tbl">
            </div>
          </div>
          <div class="dwdtl_btn">
             <a class="btngreen fr xinzeng" href="javascript:void(0)">新增单位</a>
             <a class="roominfo sidelink fr" href="javascript:void(0)">修改单位</a>
            <div class="clear"></div>
          </div>
        </div>
          <div class="bgblack bgnone"></div>
        </setup-unit-detail>
         <div class="viewwarning r10px">
          <div class="caption clearfix">
            <span class="fl">询问</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="conts">
            <p>您是否确认执行该操作？</p>
            <div class="button">
              <a href="javascript:void(0);">取消</a>
              <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
            </div>
          </div>
        </div>
           
         
      </setup-unit-topn>
    
         
    
         
         
    
         
  
      </div>
         
         
         
      </div>
      <!--商品-->
      <div class="settings bench white-scroll"  id="globaltable7">
         
         <div>
         
         
         
         
    
         
    
           <dl class="clearfix settdl">
        <dt class="fl">商品分类</dt>
    
         <dd class="fl r5px">
         
        <a href="javascript:void(0);">
      
          <div class="text"> 保健/养生</div>
           <div class="instt">3种商品</div>
           
        </a>
      </dd><dd class="fl r5px">
         
        <a href="javascript:void(0);">
      
          <div class="text"> 小商品</div>
           <div class="instt">3种商品</div>
           
        </a>
      </dd><dd class="fl r5px">
         
        <a href="javascript:void(0);">
      
          <div class="text"> 饮料/酒水</div>
           <div class="instt">3种商品</div>
           
        </a>
      </dd><dd class="fl r5px">
         
        <a href="javascript:void(0);">
      
          <div class="text"> 香烟</div>
           <div class="instt">3种商品</div>
           
        </a>
      </dd><dd class="fl r5px">
         
        <a href="javascript:void(0);">
      
          <div class="text"> 简餐</div>
           <div class="instt">3种商品</div>
           
        </a>
      </dd><dd class="fl r5px">
         
        <a href="javascript:void(0);">
      
          <div class="text"> 茶水/咖啡</div>
           <div class="instt">6种商品</div>
           
        </a>
      </dd>
         <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
         
      </dl>
         
         
          <div class="drawerdetail flex flex-v">
          <div class="dwdtl-scroll white-scroll flex-1">
            <div class="dwdtl_name clearfix">
              <span class="fl">【】所有商品</span>
              <a class="close fr" href="javascript:void(0);"></a>
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
                  <tr class="table_search">
                    <td><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                
                    <td>--</td>
                    <td>--</td>
                    <td>--</td>
                
                    <td><a class="search r3px" href="javascript:void 0"></a></td>
                  </tr>
              
                   
              
                  <tr>
                    <td colspan="12">
                       
                    </td>
                  </tr>
              
              
                  </tbody></table>
              </div>
            </div>
          </div>
          <div class="dwdtl_btn">
        
             <a class="btngreen xinzeng fr" href="javascript:void(0)">新增商品</a>
             <a class="roominfo sidelink fr" href="javascript:void(0)">修改分类</a>
          </div>
        </div>
          <div class="bgblack bgnone"></div>
           
           
           <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您确认要删除吗？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
             
           
        </detail-productcategory>
         <div class="viewwarning r10px">
          <div class="caption clearfix">
            <span class="fl">询问</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="conts">
            <p>您确认要删除吗？</p>
            <div class="button">
              <a href="javascript:void(0);">取消</a>
              <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
            </div>
          </div>
        </div>
           
         
  
  
      </productcategory-topn>
    
         
         
    
         
  
      </div>
         
         
         
      </div>
      <!--原料-->
      <div class="settings bench white-scroll"  id="globaltable8">
         
         <div>
         
         
         
         
    
         
    
         
    
           <dl class="clearfix settdl">
        <dt class="fl">原料分类</dt>
         
         <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
         
      </dl>
         
         
          <div class="drawerdetail flex flex-v">
          <div class="dwdtl-scroll white-scroll flex-1">
            <div class="dwdtl_name clearfix">
              <span class="fl">商品列表</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
        
            <div class="theinfo_tbl">
          
              <div class="globaltable r5px">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody><tr>
                
                    <td>原料名</td><td>单位</td><td>操作</td></tr>
                  <tr class="table_search">
                
                    <td><input type="text" class="ng-untouched ng-pristine ng-valid"></td>
                    <td>--</td>
                
                    <td><a class="search r3px" href="javascript:void 0"></a></td>
                  </tr>
                   
                  <tr>
                    <td colspan="12">
                       
                    </td>
                  </tr>
                  </tbody></table>
              </div>
            </div>
          </div>
          <div class="dwdtl_btn">
             <a class="btngreen xinzeng fr" href="javascript:void(0)">新增原料</a>
             <a class="roominfo sidelink fr" href="javascript:void(0)">修改原料分类</a>
      
          </div>
        </div>
          <div class="bgblack bgnone"></div>
      
           
           
      
           <div class="viewwarning r10px">
            <div class="caption clearfix">
              <span class="fl">询问</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="conts">
              <p>您确认要删除吗？</p>
              <div class="button">
                <a href="javascript:void(0);">取消</a>
                <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
              </div>
            </div>
          </div>
             
           
        </detail-ingredientcategory>
         <div class="viewwarning r10px">
          <div class="caption clearfix">
            <span class="fl">询问</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="conts">
            <p>您确认要删除吗？</p>
            <div class="button">
              <a href="javascript:void(0);">取消</a>
              <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
            </div>
          </div>
        </div>
           
         
  
  
      </ingredientcategory-topn>
         
    
         
  
      </div>
         
         
         
      </div>
      <!--角色-->
      <div class="settings bench white-scroll"  id="globaltable9">
         
         <div>
         
         
         
         
    
         
    
         
    
         
           <dl class="clearfix settdl">
        <dt class="fl">角色及权限</dt>
    
         <dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">经理</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">服务员</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">收银员</a>
      </dd><dd class="fl r5px">
         
        <a href="javascript:void(0);">系统管理员</a>
      </dd>
         <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
         
      </dl>
         
         
          <div class="drawerdetail flex flex-v">
          <div class="dwdtl-scroll white-scroll flex-1">
            <div class="dwdtl_name clearfix">
              <span class="fl">角色详细信息</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="theinfo">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td>角色名称：</td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                </tbody></table>
              <table border="1" cellpadding="0" cellspacing="0" class="qx_table">
                <tbody>
            
                </tbody></table>
            </div>
            <div class="theinfo_tbl">
            </div>
          </div>
          <div class="dwdtl_btn">
             <a class="btngreen fr xinzeng" href="javascript:void(0)">新增角色</a>
             
            <div class="clear"></div>
          </div>
        </div>
      
          <div class="bgblack bgnone"></div>
        </detail-role>
         <div class="viewwarning r10px">
          <div class="caption clearfix">
            <span class="fl">询问</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="conts">
            <p>您是否确认执行该操作？</p>
            <div class="button">
              <a href="javascript:void(0);">取消</a>
              <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
            </div>
          </div>
        </div>
           
         
      </role-topn>
    
         
  
      </div>
         
         
         
      </div>
      <!--员工-->
      <div class="settings bench white-scroll"  id="globaltable0">
         
         <div>
         
         
         
         
    
         
    
         
    
         
           <dl class="clearfix settdl">
        <dt class="fl">角色及权限</dt>
    
         <dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">经理</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">服务员</a>
      </dd><dd class="fl r5px">
         <i class="delete">删除</i>
        <a href="javascript:void(0);">收银员</a>
      </dd><dd class="fl r5px">
         
        <a href="javascript:void(0);">系统管理员</a>
      </dd>
         <dd class="fl r5px plus"><a href="javascript:void(0);">+</a></dd>
         
      </dl>
         
         
          <div class="drawerdetail flex flex-v">
          <div class="dwdtl-scroll white-scroll flex-1">
            <div class="dwdtl_name clearfix">
              <span class="fl">角色详细信息</span>
              <a class="close fr" href="javascript:void(0);"></a>
            </div>
            <div class="theinfo">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody><tr>
                  <td>角色名称：</td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                </tbody></table>
              <table border="1" cellpadding="0" cellspacing="0" class="qx_table">
                <tbody>
            
                </tbody></table>
            </div>
            <div class="theinfo_tbl">
            </div>
          </div>
          <div class="dwdtl_btn">
             <a class="btngreen fr xinzeng" href="javascript:void(0)">新增角色</a>
             
            <div class="clear"></div>
          </div>
        </div>
      
          <div class="bgblack bgnone"></div>
        </detail-role>
         <div class="viewwarning r10px">
          <div class="caption clearfix">
            <span class="fl">询问</span>
            <a class="close fr" href="javascript:void(0);"></a>
          </div>
          <div class="conts">
            <p>您是否确认执行该操作？</p>
            <div class="button">
              <a href="javascript:void(0);">取消</a>
              <a class="btnred confirm r3px" href="javascript:void(0);">确定</a>
            </div>
          </div>
        </div>
           
         
      </role-topn>
    
         
  
      </div>
         
         
         
      </div>
      
      
    </div>
        <!--弹出-->
        <div class="bgblack "></div>
        <!--门店信息-->
        <div class="drawerdetail flex flex-v" id="Stores">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">门店详细信息</span>
          <a class="close fr" href="javascript:void(0);" @click="close('Stores')"></a>
        </div>
        <div class="theinfo">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
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
            </tbody></table>
        </div>
        <div class="theinfo_tbl">
        </div>
      </div>
      <div class="dwdtl_btn">
        <a class="btngreen fr xiugai" href="javascript:void(0)">修改门店</a>
        <div class="clear"></div>
      </div>
    </div>
        <!--新增门店-->
        <div class="viewroom thin-scroll r10px " id="addStores">
    
      <div class="viewbox r10px form_cont">
        <div class="form_cap clearfix">
          <span class="fl">新增门店</span>
          <a class="close fr" href="javascript:void(0)" @click="close('addStores')"></a>
        </div>
      
        <div class="form_detail">
          <!--template bindings={}-->
          <div class="form_table">
            <table border="0" cellpadding="0" cellspacing="0">
              <tbody><tr>
                <td><em class="colorred">*&nbsp;</em>门店名称：</td>
              
                <td>
                  <!--template bindings={}-->
                  <!--template bindings={}-->
                  <input type="text" class="ng-untouched ng-pristine ng-invalid">
                </td>
                <td>联系人：</td>
              
                <td>
                  <!--template bindings={}-->
                  <input type="text" class="ng-untouched ng-pristine ng-valid">
                </td>
              </tr>
            
              <tr>
                <td>联系电话：</td>
                <td colspan="3">
                  <!--template bindings={}-->
                  <input type="text" class="ng-untouched ng-pristine ng-valid">
                </td>
            
              </tr>
              <tr>
                <td>门店地址：</td>
                <td colspan="3">
                  <select style="width: 170px" class="ng-untouched ng-pristine ng-valid">
                    <option value="0">请选择省</option>
                    <!--template bindings={}--><option value="1120">安徽省</option><option value="3513">澳门特别行政区</option><option value="2">北京市</option><option value="1258">福建省</option><option value="3195">甘肃省</option><option value="2132">广东省</option><option value="2293">广西壮族自治区</option><option value="2727">贵州省</option><option value="2432">海南省</option><option value="40">河北省</option><option value="1657">河南省</option><option value="707">黑龙江省</option><option value="1852">湖北省</option><option value="1982">湖南省</option><option value="629">吉林省</option><option value="881">江苏省</option><option value="1362">江西省</option><option value="500">辽宁省</option><option value="376">内蒙古自治区</option><option value="3361">宁夏回族自治区</option><option value="3308">青海省</option><option value="1485">山东省</option><option value="234">山西省</option><option value="3067">陕西省</option><option value="861">上海市</option><option value="2504">四川省</option><option value="3511">台湾省</option><option value="21">天津市</option><option value="2984">西藏自治区</option><option value="3512">香港特别行政区</option><option value="3394">新疆维吾尔自治区</option><option value="2830">云南省</option><option value="1007">浙江省</option><option value="2463">重庆市</option>
                  </select>
                  <select style="width: 170px" class="ng-untouched ng-pristine ng-valid">
                    <option value="0">请选择市</option>
                    <!--template bindings={}-->
                  </select>
                  <select style="width: 165px" class="ng-untouched ng-pristine ng-valid">
                    <option value="0">请选择县(区)</option>
                    <!--template bindings={}-->
                  </select>
                </td>
              </tr>
              <tr>
                <td>街道地址：</td>
                <td colspan="3">
                  <!--template bindings={}-->
                  <input style="width: 513px" type="text" class="ng-untouched ng-pristine ng-valid">
                </td>
              </tr>

              </tbody></table>
          </div>
          <div class="form_btn">
            <a class="btngreen baocun" href="javascript:void(0)">保存</a>
          </div>
        </div>
    
      </div>
  
    </div>
        <!--会员级别-->
        <!--普通会员-->
        <div class="drawerdetail flex flex-v " id="regular">
      <div class="dwdtl-scroll white-scroll flex-1">
        <div class="dwdtl_name clearfix">
          <span class="fl">会员等级详细信息</span>
          <a class="close fr" href="javascript:void(0);" @click="close('regular')"></a>
        </div>
        <div class="theinfo">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>等级编号：</td>
              <td>20170301346544</td>
              <td>会员等级：</td>
              <td>普通会员</td>
            </tr>
            <tr>
              <td>商品折扣：</td>
              <td>无折扣</td>
              <td>包间折扣：</td>
              <td>无折扣</td>
            </tr>
            <tr>
              <td>创建时间：</td>
              <td colspan="3">2017-03-01 09:37:34</td>
            </tr>

            </tbody></table>
        </div>
        <div class="theinfo_tbl">
        </div>
      </div>
      <div class="dwdtl_btn">
        <!--template bindings={}--><a class="btngreen fr xinzeng" href="javascript:void(0)" @click="popup('addmember','1')">新增等级</a>
        <!--template bindings={}--><a class="roominfo sidelink fr" href="javascript:void(0)" @click="popup('grade','1')">修改等级</a>
        <div class="clear"></div>
      </div>
    </div>
        <!--修改会员等级-->
        <div class="viewsmall form_cont r10px" id="grade">
      <div class="form_cap clearfix">
        <span class="fl">修改会员等级</span>
        <a class="close fr" href="javascript:void(0);" @click="close('grade')"></a>
      </div>
      <div class="form_detail">
        <!--template bindings={}-->
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>会员等级：</td>
              <td>
                <input autofocus="true" placeholder="请输入会员等级名称" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
          
            <tr>
              <td>商品折扣：</td>
              <td><input autofocus="true" maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            <tr>
              <td>包间折扣：</td>
              <td><input maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            </tbody></table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);">保存</a>
        </div>
      </div>
    </div>
        <!--新增会员等级-->
        <div class="viewsmall form_cont r10px " id="addmember">
      <div class="form_cap clearfix">
        <span class="fl">添加会员等级</span>
        <a class="close fr" href="javascript:void(0);" @click="close('addmember')"></a>
      </div>
      <div class="form_detail">
        <!--template bindings={}-->
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>会员等级：</td>
              <td><input autofocus="true" placeholder="请输入会员等级名称" type="text" class="ng-untouched ng-pristine ng-invalid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>

            <tr>
              <td>商品折扣：</td>
              <td><input autofocus="true" maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-invalid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            <tr>
              <td>包间折扣：</td>
              <td><input maxlength="4" placeholder="请输入折扣，如0.8" type="text" class="ng-untouched ng-pristine ng-invalid">
              </td>
              <td colspan="2" style="text-align:left; padding:0;"></td>
            </tr>
            </tbody></table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);">保存</a>
        </div>
      </div>
    </div>
    
    
    
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
        var open = open;
        if(open==1){
          $('.bgblack').addClass('in');
        }
        
      },
      close(id){
        var id = '#'+id;
        $(id).removeClass('in');
        $('.bgblack').removeClass('in');
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
