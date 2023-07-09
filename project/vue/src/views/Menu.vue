<template>
  <el-space wrap>
    <el-card v-for="i in 8" :key="i" class="box-card" style="width: 100px">
      <template #header>
        <div class="card-header">
          <span>Card name</span>
          <el-button class="button" text>Operation button</el-button>
        </div>
      </template>
      <div v-for="o in 4" :key="o" class="text item">
        {{ 'List item ' + o }}
      </div>
    </el-card>
  </el-space>
</template>

<script>
export default {
  name: "Menu"
}
</script>

<style scoped>

</style>