<template>
  <div class="divBox" style="padding-bottom: 0">
    <el-row :gutter="20" class="baseInfo">
      <el-col v-bind="grid" class="ivu-mb">
        <el-card :bordered="false" dis-hover :padding="12">
          <div class="acea-row row-between-wrapper">
            <div class="acea-row align-center">
              <span class="main_tit">评论数量</span>
            </div>
            <el-tag type="primary">近一天</el-tag>
          </div>
          <div class="content" v-if="viewData">
            <span class="content-number spBlock my15">{{ viewData.yesterdayCommentCount }}</span>
            <el-divider></el-divider>
            <div class="acea-row row-between-wrapper">
              <span class="content-time">总评论</span>
              <span class="content-time">{{ viewData.commentCount }}条</span>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col v-bind="grid" class="ivu-mb">
        <el-card :bordered="false" dis-hover :padding="12">
          <div class="acea-row row-between-wrapper">
            <div class="acea-row align-center">
              <span class="main_tit">用户量</span>
            </div>
            <el-tag type="primary">总量</el-tag>
          </div>
          <div class="content" v-if="viewData">
            <span class="content-number spBlock my15">{{
              viewData.totalUser
            }}</span>
            <el-divider></el-divider>
            <div class="acea-row row-between-wrapper">
              <span class="content-time">普通游客</span>
              <span class="content-time">{{ viewData.totalUser }}</span>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col v-bind="grid" class="ivu-mb">
        <el-card :bordered="false" dis-hover :padding="12">
          <div class="acea-row row-between-wrapper">
            <div class="acea-row align-center">
              <span class="main_tit">帖子数</span>
            </div>
            <el-tag type="primary">全部</el-tag>
          </div>
          <div class="content" v-if="viewData">
            <span class="content-number spBlock my15">{{
              viewData.totalPost
            }}</span>
            <el-divider></el-divider>
            <div class="acea-row row-between-wrapper">
              <span class="content-time">待审核</span>
              <span class="content-time">{{ viewData.totalPostOfReview }}条</span>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col v-bind="grid" class="ivu-mb">
        <el-card :bordered="false" dis-hover :padding="12">
          <div class="acea-row row-between-wrapper">
            <div class="acea-row align-center">
              <span class="main_tit">新增用户</span>
            </div>
            <el-tag type="primary">今日</el-tag>
          </div>
          <div class="content" v-if="viewData">
            <span class="content-number spBlock my15">{{
              viewData.newUserNum
            }}</span>
            <el-divider></el-divider>
            <div class="acea-row row-between-wrapper">
              <span class="content-time">昨日数据</span>
              <span class="content-time">{{ viewData.yesterdayNewUserNum }} 人</span>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
        <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
       
      </el-col>

    </el-row>
    <el-divider />
  </div>
</template>
<script>
export default {
  data() {
    return {
      grid: { xl: 6, lg: 6, md: 12, sm: 12, xs: 24 },
      viewData: {},
    };
  },
  methods: {
    goTo(href) {
      window.open(href, "_blank");
    },
    statisticsOrder() {
      this.dataListLoading = true;
      this.$http({
        url: this.$http.adornUrl("/admin/statistics/home"),
        method: "get",
      }).then(({ data }) => {
        if (data && data.code === 0) {
          // console.log(data.result)
          this.viewData = data.result;
        }
        this.dataListLoading = false;
      });
    },
  },
  mounted() {
    this.statisticsOrder();
  },
};
</script>
<style scoped lang="scss">
.acea-row{
  display: flex;
  flex-wrap: wrap;
}
.row-between-wrapper{
  justify-content: space-between;
}
.ivu-mb {
  margin-bottom: 20px;
}

.up,
.el-icon-caret-top {
  color: #f5222d;
  font-size: 12px;
  opacity: 1 !important;
}

.down,
.el-icon-caret-bottom {
  color: #39c15b;
  font-size: 12px;
}

.main_tit {
  color: #333;
  font-size: 14px;
  font-weight: 500;
}

.content-time {
  font-size: 14px;
  color: #333;
  font-weight: 500;
}

.main_badge {
  width: 30px;
  height: 30px;
  border-radius: 5px;
  margin-right: 10px;
  background: #2c90ff;
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
}

.my15 {
  margin: 15px 0 15px;
}

.align-center {
  align-items: center;
}

.baseInfo {
  ::v-deep(.el-card__header) {
    padding: 15px 20px !important;
  }
}


.content {
  &-number {
    font-size: 30px;
    font-weight: 600;
    font-family: PingFangSC-Semibold, PingFang SC;
    color: #333;
  }

  &-time {
    font-size: 14px;
    color: #333333;
    font-weight: 400;
  }
}
</style>