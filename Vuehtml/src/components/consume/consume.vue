<template>
  <div>
  
    <div class="contview">
      <div class="contviewtab">
        <a href="javascript:void(0);" class="current" @click="navclick('')" id="nav">全部</a>
        <a href="javascript:void(0);" class="" @click="navclick('2')" id="nav2">消费中</a>
        <a href="javascript:void(0);" class="" @click="navclick('3')" id="nav3">合并中</a>
        <a href="javascript:void(0);" class="" @click="navclick('4')" id="nav4">挂单</a>
        <a href="javascript:void(0);" class="" @click="navclick('5')" id="nav5">已取消</a>
        <a href="javascript:void(0);" class="" @click="navclick('6')" id="nav6">已结账</a>
      </div>
      <div class="contable_title clearfix" style="padding:0px 40px;margin-top: 10px;">
        <div class="jymxtime fr">开单时间：
          <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailBeginTime" type="text">至
          <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailEndTime" type="text">
          服务生：<select class="ng-untouched ng-pristine ng-valid">
            <option value="0">请选择员工</option>
            <option value="20170301346421">
            琳琳
          </option>
          </select>
          <a class="search r3px" href="javascript:void(0)">查询</a></div>
      </div>
      <!--全部-->
      <div class="bench white-scroll r5px member" style="padding-top: 0px;margin-top: 40px;display: block" id="globaltable">
        <div class="globaltable white-scroll">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
          <tr>
            <td>消费单编号</td>
            <td width="15%">开单时间</td>
            <td>消费时长</td>
            <td>状态</td>
            <td>房间名称</td>
            <td>类型</td>
            <td>包间消费</td>
            <td>商品消费</td>
            <td>会员优惠</td>
            <td>手动优惠</td>
            <td>实付金额</td>
            <td>操作</td>
          </tr>
          <tr>
            <td>20170310546191</td>
            <td>2017-03-10 15:10:18</td>
            <td>24小时26分</td>
            <td>消费中</td>
            
            
            
            
            <td>小包-小包2</td>
            <td style="">普通账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
            
              
            </td>
          </tr><tr>
            <td>20170308612851</td>
            <td>2017-03-08 17:01:24</td>
            <td>70小时34分</td>
            
            
            
            
            <td>合并中</td>
            <td>小包-小包1</td>
            <td style="">子账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
            
              
            </td>
          </tr><tr>
            <td>20170308610131</td>
            <td>2017-03-08 16:56:50</td>
            <td>70小时39分</td>
            <td>消费中</td>
            
            
            
            
            <td>大包-大包1</td>
            <td style="">主账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
            
              
            </td>
          </tr><tr>
            <td>20170308548881</td>
            <td>2017-03-08 15:14:44</td>
            <td>72小时21分</td>
            
            
            
            
            <td>合并中</td>
            <td>大厅-2号桌</td>
            <td style="">子账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
            
              
            </td>
          </tr><tr>
            <td>20170308548661</td>
            <td>2017-03-08 15:14:19</td>
            <td>72小时22分</td>
            <td>消费中</td>
            
            
            
            
            <td>大厅-3号桌</td>
            <td style="">普通账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
            
              
            </td>
          </tr><tr>
            <td>20170308547611</td>
            <td>2017-03-08 15:12:37</td>
            <td>72小时23分</td>
            
            
            
            
            <td>合并中</td>
            <td>大厅-1号桌</td>
            <td style="">子账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
            
              
            </td>
          </tr><tr>
            <td>20170308547491</td>
            <td>2017-03-08 15:12:27</td>
            <td>72小时23分</td>
            
            
            
            
            <td>合并中</td>
            <td>大厅-2号桌</td>
            <td style="">子账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
            
              
            </td>
          </tr><tr>
            <td>20170308322821</td>
            <td>2017-03-08 08:58:00</td>
            <td>78小时38分</td>
            <td>消费中</td>
            
            
            
            
            <td>大厅-4号桌</td>
            <td style="">主账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
            
              
            </td>
          </tr><tr>
            <td>20170306365321</td>
            <td>2017-03-06 10:08:52</td>
            <td>0小时0分</td>
            
            <td><span class="colorgreen">已结账</span></td>
            
            
            
            <td>吧台消费</td>
            <td style="">普通账单</td>
            <td> <span>0.0</span> </td>
            <td> <span>30.0</span> </td>
            <td> <span>0.0</span> </td>
            <td> <span>0.0</span> </td>
            <td> <span>30.0</span> </td>
            <td>
              
              
            
              <a>打印</a>
            </td>
          </tr>
          </tbody>
            <tbody><tr>
              <td colspan="12">
                <div></div>
                <div>
                <div class="page clearfix">
                  <div class="text">共<b>1</b>页<b>9</b>条记录</div>
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
      <!--消费中-->
      <div class="bench white-scroll r5px member" style="padding-top: 0px;margin-top: 40px;" id="globaltable2">
        <div class="globaltable white-scroll">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
          <tr>
            <td>消费单编号</td>
            <td width="15%">开单时间</td>
            <td>消费时长</td>
            <td>状态</td>
            <td>房间名称</td>
            <td>类型</td>
            <td>包间消费</td>
            <td>商品消费</td>
            <td>会员优惠</td>
            <td>手动优惠</td>
            <td>实付金额</td>
            <td>操作</td>
          </tr>
          <tr>
            <td>20170310546191</td>
            <td>2017-03-10 15:10:18</td>
            <td>24小时37分</td>
            <td>消费中</td>
            
            
            
            
            <td>小包-小包2</td>
            <td style="">普通账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
          
              
            </td>
          </tr><tr>
            <td>20170308610131</td>
            <td>2017-03-08 16:56:50</td>
            <td>70小时50分</td>
            <td>消费中</td>
            
            
            
            
            <td>大包-大包1</td>
            <td style="">主账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
          
              
            </td>
          </tr><tr>
            <td>20170308548661</td>
            <td>2017-03-08 15:14:19</td>
            <td>72小时33分</td>
            <td>消费中</td>
            
            
            
            
            <td>大厅-3号桌</td>
            <td style="">普通账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
          
              
            </td>
          </tr><tr>
            <td>20170308322821</td>
            <td>2017-03-08 08:58:00</td>
            <td>78小时49分</td>
            <td>消费中</td>
            
            
            
            
            <td>大厅-4号桌</td>
            <td style="">主账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
          
              
            </td>
          </tr>
          </tbody>
            <tbody><tr>
              <td colspan="12">
                <div></div>
                <div>
               <div class="page clearfix">
                  <div class="text">共<b>1</b>页<b>4</b>条记录</div>
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
      <!--合并中-->
      <div class="bench white-scroll r5px member" style="padding-top: 0px;margin-top: 40px;" id="globaltable3">
        <div class="globaltable white-scroll">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
          <tr>
            <td>消费单编号</td>
            <td width="15%">开单时间</td>
            <td>消费时长</td>
            <td>状态</td>
            <td>房间名称</td>
            <td>类型</td>
            <td>包间消费</td>
            <td>商品消费</td>
            <td>会员优惠</td>
            <td>手动优惠</td>
            <td>实付金额</td>
            <td>操作</td>
          </tr>
          <tr>
            <td>20170308612851</td>
            <td>2017-03-08 17:01:24</td>
            <td>70小时47分</td>
            
            
            
            
            <td>合并中</td>
            <td>小包-小包1</td>
            <td style="">子账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
          
              
            </td>
          </tr><tr>
            <td>20170308548881</td>
            <td>2017-03-08 15:14:44</td>
            <td>72小时33分</td>
            
            
            
            
            <td>合并中</td>
            <td>大厅-2号桌</td>
            <td style="">子账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
          
              
            </td>
          </tr><tr>
            <td>20170308547611</td>
            <td>2017-03-08 15:12:37</td>
            <td>72小时35分</td>
            
            
            
            
            <td>合并中</td>
            <td>大厅-1号桌</td>
            <td style="">子账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
          
              
            </td>
          </tr><tr>
            <td>20170308547491</td>
            <td>2017-03-08 15:12:27</td>
            <td>72小时35分</td>
            
            
            
            
            <td>合并中</td>
            <td>大厅-2号桌</td>
            <td style="">子账单</td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>  <span>-</span></td>
            <td>
              
              
          
              
            </td>
          </tr>
          </tbody>
            <tbody><tr>
              <td colspan="12">
                <div></div>
                <div>
                <div class="page clearfix">
                  <div class="text">共<b>1</b>页<b>4</b>条记录</div>
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
      <!--挂单-->
      <div class="bench white-scroll r5px member" style="padding-top: 0px;margin-top: 40px;"  id="globaltable4">
        <div class="globaltable white-scroll">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
          <tr>
            <td>消费单编号</td>
            <td width="15%">开单时间</td>
            <td>消费时长</td>
            <td>状态</td>
            <td>房间名称</td>
            <td>类型</td>
            <td>包间消费</td>
            <td>商品消费</td>
            <td>会员优惠</td>
            <td>手动优惠</td>
            <td>实付金额</td>
            <td>操作</td>
          </tr>
          
          </tbody>
            <tbody><tr>
              <td colspan="12">
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
      <!--已取消-->
      <div class="bench white-scroll r5px member" style="padding-top: 0px;margin-top: 40px;" id="globaltable5">
        <div class="globaltable white-scroll">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
          <tr>
            <td>消费单编号</td>
            <td width="15%">开单时间</td>
            <td>消费时长</td>
            <td>状态</td>
            <td>房间名称</td>
            <td>类型</td>
            <td>包间消费</td>
            <td>商品消费</td>
            <td>会员优惠</td>
            <td>手动优惠</td>
            <td>实付金额</td>
            <td>操作</td>
          </tr>
          
          </tbody>
            <tbody><tr>
              <td colspan="12">
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
      <!--已结账-->
      <div class="bench white-scroll r5px member" style="padding-top: 0px;margin-top: 40px;"  id="globaltable6">
        <div class="globaltable white-scroll">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
          <tr>
            <td>消费单编号</td>
            <td width="15%">开单时间</td>
            <td>消费时长</td>
            <td>状态</td>
            <td>房间名称</td>
            <td>类型</td>
            <td>包间消费</td>
            <td>商品消费</td>
            <td>会员优惠</td>
            <td>手动优惠</td>
            <td>实付金额</td>
            <td>操作</td>
          </tr>
          <tr>
            <td>20170306365321</td>
            <td>2017-03-06 10:08:52</td>
            <td>0小时0分</td>
            
            <td><span class="colorgreen">已结账</span></td>
            
            
            
            <td>吧台消费</td>
            <td style="">普通账单</td>
            <td> <span>0.0</span> </td>
            <td> <span>30.0</span> </td>
            <td> <span>0.0</span> </td>
            <td> <span>0.0</span> </td>
            <td> <span>30.0</span> </td>
            <td>
              
              
          
              <a>打印</a>
            </td>
          </tr>
          </tbody>
            <tbody><tr>
              <td colspan="12">
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
            </tbody></table>
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
      popup (id){
        var id = '#'+id;
        $(id).addClass('in');
        $('.bgblack').addClass('in');
      },
      close(id){
        var id = '#'+id;
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
