<template>
  <Navbar />
  <div class="container grid items-center py-4">
    <router-view></router-view>
  </div>
</template>

<script setup>

import Navbar from "./components/Navbar.vue";
import { onMounted, watch } from "vue";
import { computed } from 'vue';
import { useAuthStore } from './store/auth';


const authStore = useAuthStore();

const user = computed(() => authStore.user);
const isLoggedIn = computed(() => authStore.isLoggedIn);


// const { result } = useQuery(ListMatchQuery);
// console.log(result)

onMounted(() => {
  const storedUser = localStorage.getItem("authUser");
  if (storedUser) {
    authStore.setUser(JSON.parse(storedUser));
  }
});

watch(
  () => authStore.user,
  (newUser) => {
    if (newUser) {
      localStorage.setItem("authUser", JSON.stringify(newUser));
    } else {
      localStorage.removeItem("authUser");
    }
  }
);

</script>

<style scoped>
#container {
  margin: 0 auto;
  padding: 2rem;
  text-align: center;
}
</style>
