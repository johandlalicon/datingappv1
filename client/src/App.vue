<script setup>
import { useStore } from 'vuex'
import LoginForm from './components/LoginForm.vue';
import { computed } from 'vue';

const store = useStore();
const userId = store.state.user;

</script>

<template>
  <div>
    <LoginForm />
  </div>
</template>

<style scoped></style>
