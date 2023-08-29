<template>
    <nav class="bg-gray-200 p-4 flex justify-between ">
        <LoginForm v-if="!isLoggedIn" />
        <button @click="logout">LOGOUT</button>
    </nav>
</template>
<script setup>
import LoginForm from './LoginForm.vue';
import { useAuthStore } from '../store/auth';
import { computed } from 'vue';
const authStore = useAuthStore();
const isLoggedIn = computed(() => authStore.isLoggedIn);


const logout = () => {
    // Clear user data in the store
    authStore.setUser(null);

    // Clear user data in local storage
    localStorage.removeItem("authUser");
};


</script>

<style></style>