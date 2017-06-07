<template>
  <div>
    <!--抽奖转盘-->
    <div class="msglist  msgshow" >
      <div class="box">
        <canvas id="canvas"  width="300" height="300" ></canvas>
        <img src="static/images/draw.png" class="drawBtn  " @click="gotoDraw()" style="width: 100px;
    height: auto;
    position: fixed;
    left: 0;
    top: 0;bottom: 0;right: 0;margin: auto;">
      </div>
    </div>
    <!--抽奖转盘/end-->
    <!--遮罩层-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
    <!--遮罩层end-->
    <!--loading-->
    <div type="primary" element-loading-text="拼命加载中" v-loading.fullscreen.lock="isLoading"></div>
    <!--loading-->
  </div>
</template>
<script>
  export  default{
    data(){
      return{
        iSsuccess: false,
        isLoading: false,
        draws:'',
        drawData:[],
        drawStatus:'',
        drawNum:'',
        drawCount:1,
      }
    },
    methods:{
      /*@module 抽奖转盘
       *@param  arr(Array)奖品数据
       */
      draw(arr) {
        var canvas = document.getElementById('canvas');
        var ctx = canvas.getContext('2d');
        //背景圆-外圈
        ctx.beginPath();
        ctx.strokeStyle = '#fde373';//背景色;
        ctx.lineWidth = '8';
        ctx.arc(150, 150, 140, 0, Math.PI * 2, true);
        ctx.stroke();
        ctx.closePath();
        ctx.save();
        // 内圈
        ctx.beginPath();
        ctx.strokeStyle = '#f95b54';//背景色;
        ctx.lineWidth = '15';
        ctx.arc(150, 150, 130, 0, Math.PI * 2, true);
        ctx.stroke();
        ctx.closePath();
        ctx.save();
        ctx.beginPath();
        //圆圈上的小圆点
        for(var i=0;i<24;i++){
          // 移动到圆心
          ctx.save();
          ctx.fillStyle='#fff'
          ctx.lineWidth = '4';
          if(i%2==0){
            ctx.strokeStyle="#fff";
          }else{
            ctx.strokeStyle="#fde373";
          }
          ctx.translate(150,150);
          ctx.fill();
          ctx.rotate(i*15*Math.PI/180);//角度*Math.PI/180=弧度
          ctx.beginPath();
          ctx.arc(120, 50, 1, 0, Math.PI * 2, true);
          ctx.stroke();
          ctx.closePath();
          ctx.restore();
        }
        //奖品图
    
        ctx.translate(150, 150);
        var  oldMathPI=0;
        var a_pi = 0.0055555555556;//1度对应的PI值;
        for(var i=1;i<arr.length+1;i++){
          if(i==1){
            ctx.beginPath();
            ctx.fillStyle='#fff';
            ctx.moveTo(0, 0);
            // 绘制圆弧
            ctx.arc(0, 0, 123, Math.PI*1.5,  (1.5 - (a_pi * i*(360/arr.length))) * Math.PI,true);
            ctx.fill();
            ctx.closePath();
          }else{
            ctx.beginPath();
            if(i%2==0){
              ctx.fillStyle='#fde373';
            }else{
              ctx.fillStyle='#eee';
            }
            ctx.moveTo(0, 0);
            ctx.arc(0, 0, 123, Math.PI*oldMathPI,  (1.5 - (a_pi * i*(360/arr.length))) * Math.PI,true);
            ctx.fill();
            ctx.save();
            ctx.closePath();
          }
          oldMathPI=(1.5 - (a_pi * i*(360/arr.length )));
        }
        ctx.strokeStyle = '#000';
        ctx.fillStyle = '#000';
        ctx.lineWidth = '1';
        ctx.font = " 15px '微软雅黑'";
        for(var j=1;j<arr.length+1;j++){
          if(j==1){
            ctx.rotate( 270*Math.PI/180);
            ctx.rotate(  ((360/arr.length)/2)*Math.PI/180);
            ctx.fillText(arr[j-1], 50, 0);
          }else{
            ctx.rotate(  ((360/arr.length))*Math.PI/180);
            ctx.fillText(arr[j-1], 50, 0);
          }
        }
      },
      /*@module初始化转盘*/
      drawInit(){
      	var _this=this;
        this.draws = new turntableDraw('.drawBtn',{
          share:this.drawNum,
          speed:"3s",
          velocityCurve:"ease-in-out",
          weeks:30,
          callback:function(num)
          {
            _this.drawCallback(num);
          },
        });
      },
      /*@module开始抽奖*/
      gotoDraw(){
      	var _this=this;
        if(!this.drawCount){
        	//只能抽奖一次
        	return;
        }
      	_this.ajax(_this.port.getdraw,'','get',function (res) {
      		if(res.code==1){
      			for(let i=0;i<_this.drawData.length;i++){
      				if(res.data==_this.drawData[i]){
                _this.draws.goto(i+1);
              }
            }
            _this.drawCount--;
          }else{
      			//初始化失败请重试
          }
        })
      },
      /*@module抽中的奖品*/
      drawCallback(num){
      	alert(num)
      },
      /*@module初始化抽奖数据*/
      drawDataInit(){
      	var _this=this;
        _this.ajax(_this.port.drawInit,'','get',function (res) {
          if(res.code==1){
          	if(res.data.status){ //抽奖开启模式
              _this.drawData=[],
              _this.drawStatus='';
              _this.drawNum='';
              _this.drawData=res.data['prize'],
              _this.drawStatus=res.data['status'];
              _this.drawNum=res.data['number'];
              _this.draw(_this.drawData);
              _this.drawInit();
            }
          
          }else{
          	//抽奖关闭模式
             //codeing.....
          }
        })
      },
    },
    mounted(){
    	this.drawDataInit();
    }
  }
</script>
<style scoped>
  .drawBtn{
    width: 100px;
    height: auto;
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    right: 0;
    margin: auto;
  }
  #canvas{
    position: fixed;
    width:300px;
    height:300px;
    left: 0;
    right: 0;
    bottom: 0;
    top: 0;
    margin: auto
  }
</style>
