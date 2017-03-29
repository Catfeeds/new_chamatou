<template>
  <div>
  
    <div class="contview">
      <div class="contviewtab">
        <a href="javascript:void(0);" class="current"  @click="navclick('')" id="nav">未处理任务(0)</a>
        <a href="javascript:void(0);" class=""  @click="navclick('2')" id="nav2">已处理任务(0)</a>
      </div>
      
    <div>
      <!--未处理的任务-->
       <div class="bench white-scroll newmessage" style="display: block;" id="globaltable">
       
        <ul>
          
        </ul>
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
      </div>
      <!--已处理的任务-->
      <div class="bench white-scroll newmessage" id="globaltable2">
        
        <ul>
          
        </ul>
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
