<template>
  <div class="contview">
    <div class="contviewtab">
      <a href="javascript:void(0);" class="current information" @click="changeNav(0)">交接班记录</a>
    </div>
    <div>
      <div class="bench white-scroll" style="top: 45px;">
        <div class="globaltable r5px">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>当班员工</td>
              <td width="20%">交班时间</td>
              <td>接班员工</td>
              <td width="8%">本班开始时间</td>
              <td width="8%">本班结束时间</td>
              <td>本班总收入</td>
              <td>上缴金额</td>
              <td>留存金额</td>
              <td width="15%">备注</td>
              <td>操作</td>
            </tr>
            <tr class="table_search">
              <td>
                <select class="ng-untouched ng-pristine ng-valid" v-model="dstaffId" @change="Search()">
                <option value="0">全部</option>
                <option v-for="(staff,index) in staffList" :value="staff.id" >{{staff.user}}</option>
              </select>
              </td>
              <td>
              <input v-model="start_time" @click="selectDate('#dateHandoverworkBegin')" class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="dateHandoverworkBegin" style="width: 120px;" type="text">
             &nbsp;&nbsp;-&nbsp;&nbsp;
              <input v-model="end_time"   @click="selectDate('#dateHandoverworkEnd')" class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="dateHandoverworkEnd" style="width: 120px;" type="text">
              </td>
              <td>
                <select class="ng-untouched ng-pristine ng-valid"  v-model="jstaffId"  @change="Search()">
                  <option value="0">全部</option>
                  <option v-for="(staff,index) in staffList" :value="staff.id" >{{staff.user}}</option>
                </select>
              </td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td><a class="search r3px" href="javascript:void(0)"></a></td>
            </tr>
            <tr v-for="(handworklist,index) in HandWorkList.list">
              <td>{{handworklist.auth_user_id}}</td>
              <td>{{handworklist.add_time}}</td>
              <td>{{handworklist.jieban_user_id}}</td>
              <td>{{handworklist.start_time}}</td>
              <td>{{handworklist.end_time}}</td>
              <td>{{handworklist.current_amount}}</td>
              <td>{{handworklist.up_amount}}</td>
              <td>{{handworklist.remain_amount}}</td>
              <td>{{handworklist.note}}</td>
              <td>
                <!--<a href="javascript:void(0)">查看</a>-->
                <!--&nbsp;&nbsp;-->
                <!--<a href="javascript:void(0)">打印</a>-->
                --
              </td>
            </tr>
            <tr>
              <td colspan="9">
                <div>
                  <div class="page clearfix">
                    <div class="text">共<b>{{HandWorkList.pageNum}}</b>页<b>{{HandWorkList.pageCount}}</b>条记录</div>
                    <div class="linklist">
                      <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev')">&nbsp;</a>
                      <a v-for="(pages,index) in pageList" href="javascript:void(0)" :class="{'current' : (page==pages)}"  @click="changePage(pages)">
                        {{pages==0?'...':pages}}
                      </a>
                      <a class="next" href="javascript:void(0)"  @click="changePage(page,'next')">&nbsp;</a>
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
  export  default{
  	data(){
  		return {
        isLoading: false,
        iSsuccess:false,
        msgShow: false,
        msg: '',
  			HandWorkList:[],
        page:1,
        pageList:[],
        staffList:[],
        dstaffId:0,
        jstaffId:0,
        start_time:'',
        end_time:'',
      }
    },
    methods:{
      Search(){
      	this.page=1;
      	this.initData();
      },
  		//初始化记录数据
      initData(){
      	var _this=this;
      	const data={
      		page:_this.page,
          start_time:_this.start_time,
          end_time:_this.end_time,
          jieban_user_id:_this.jstaffId,
          auth_user_id:_this.dstaffId,
        }
      	_this.ajax(_this.port.HandWorkList,data,'get',function (res) {
          if(res.code==1){
          	_this.HandWorkList=[];
          	_this.pageList=[];
          	_this.HandWorkList=res.data;
            _this.getpage(_this.page);
          }
        })
      },
  		//切换分页
      changePage(page,type){
        if(Number(page)){
          var _this=this;
          if(type) {
            if (type == 'prev') {
              if (page > 1) {
                page--;
                _this.page = page;
                _this.initData();
              } else {
                return;
              }
            } else {
              if (page < _this.HandWorkList.pageNum) {
                page++;
                _this.page = page;
                _this.initData();
              } else {
                return;
              }
            }
          }else{
            _this.page=page;
            _this.initData();
          }
        }
      },
      //获取分页数据
      getpage(page){
        var _this=this;
        if(_this.HandWorkList.pageNum>10){
          //当前页小于6
          if(page<6){
            _this.pageList=[];
            for(let i=1;i<=7;i++){
              if(i==7){
                _this.pageList.push(0);
              }else{
                _this.pageList.push(i);
              }
            }
            _this.pageList.push(_this.HandWorkList.pageNum);
            _this.page=page;
          }
          //当前页中间部分
          if(page>5 && page<_this.HandWorkList.pageNum-2){
            _this.pageList=[];
            _this.pageList.push(1,0);
            for(let i=page-2;i<=page+2;i++){
              _this.pageList.push(i);
            }
            _this.pageList.push(0,_this.HandWorkList.pageNum);
            _this.page=page;
          }
          //最后几页
          if(_this.HandWorkList.pageNum-2<=page && page<=_this.HandWorkList.pageNum){
            _this.pageList=[];
            _this.pageList.push(1,0);
            for(let i=_this.HandWorkList.pageNum-6;i<=_this.HandWorkList.pageNum;i++){
              _this.pageList.push(i);
            }
            _this.page=page;
          }
        }else{
          _this.page=page;
          _this.pageList=[];
          for(let i=1;i<=_this.HandWorkList.pageNum;i++){
            _this.pageList.push(i);
          }
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
      //时间插件
      selectDate(elem){
      	var _this=this;
        laydate({
          elem: elem,
          istime: false,
          istoday: false,
          isclear:false,
          issure:false,
          choose: function (dates) {
          	if(elem=='#dateHandoverworkBegin'){
              _this.start_time=dates;
              if(_this.end_time!=''){
                _this.Search();
              }
            }else{
              _this.end_time=dates;
          		if(_this.start_time!=''){
                _this.Search();
              }
          		
            }
          }
          });
      },
  		
    },
    mounted(){
      var str = window.location.href;
      if(str.indexOf('handwork')!=-1){
        $('#navstr').html('交班记录');
      }
      this.staffInit();
  		this.initData();
    }
  }
</script>
