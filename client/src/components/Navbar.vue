<template>
    <nav class="bg-gray-200 p-4 justify-between shadow-lg gap-8">
        <div class="flex justify-between">
            <div v-if="!isLoggedIn">
                <LoginForm />
            </div>
            <div v-else class="flex gap-4 ">
                <div class="flex gap-4">
                    <router-link to="/swipe">SWIPE</router-link>
                    <router-link to="/match">MATCH</router-link>
                </div>
                <div class="justify-self-end">
                    <button @click="logout">LOGOUT</button>
                </div>
            </div>
        </div>
    </nav>
</template>
<script setup>
import LoginForm from './LoginForm.vue';
import { useAuthStore } from '../store/auth';
import { computed } from 'vue';
const authStore = useAuthStore();
const isLoggedIn = computed(() => authStore.isLoggedIn);


const logout = () => {
    authStore.setUser(null);
    localStorage.removeItem("authUser");

    window.location.reload();
    window.location.href = "/";
};


</script>

<style></style>