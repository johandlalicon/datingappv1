<template>
  <!-- Conditional rendering of LoginForm component -->
  <Navbar />

  <div>
    <ProfileCard />
  </div>
  <!-- <LoginForm v-if="!isLoggedIn" /> -->
</template>

<script setup>
import ProfileCard from './components/ProfileCard.vue';
import Navbar from './components/Navbar.vue';
import { onMounted, watch } from "vue";
import { computed } from 'vue';
import { useAuthStore } from './store/auth';
import ListMatchQuery from './graphql/findMatch.query.gql'
import { useQuery } from "@vue/apollo-composable"

const authStore = useAuthStore();

const user = computed(() => authStore.user);
const isLoggedIn = computed(() => authStore.isLoggedIn);


const { result } = useQuery(ListMatchQuery);
console.log(result)

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

<style scoped></style>
