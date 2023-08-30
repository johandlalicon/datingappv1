<template>
    <p v-if="error" class="p-4">{{ error.message }}</p>
    <form>
        <div class="flex gap-4 item-center items-center">
            <BaseInput v-model="userEmail" placeholder="Email" type="email" />
            <BaseInput v-model="userPassword" type="password" placeholder="Password" />
            <button type="button" @click="onSubmit" class="py-2 px-4 text-sm bg-sky-500 text-white">
                SIGN IN
            </button>
        </div>
    </form>
</template>
  
<script setup>
import { ref } from 'vue';

import { useAuthStore } from '../store/auth';
import BaseInput from './BaseInput.vue';
import { useMutation } from "@vue/apollo-composable"
import SignInMutation from "../graphql/user.mutation.gql"

const authStore = useAuthStore();

const { mutate: signInUser, onDone, onError, error, result } = useMutation(SignInMutation, () => ({
    variables: {
        email: userEmail.value,
        password: userPassword.value,
    }
}))

const userEmail = ref("")
const userPassword = ref("")


function onSubmit() {
    signInUser();
}
onDone(result => {
    const user = result.data.signInUser.user;
    console.log(user)
    authStore.setUser(user)
    localStorage.setItem('token', result.data.signInUser.token)
})

</script>
  
<style></style>
  