<template>
    <div class="sm:container mt-4 ">
        <div v-if="error">{{ error.message }}</div>
        <form class="gap-2 flex-col flex absolute">
            <BaseInput v-model="userEmail" placeholder="Email" type="email" />
            <BaseInput v-model="userPassword" placeholder="Password" type="password" />
            <BaseInput v-model="firstName" placeholder="First Name" />
            <BaseInput v-model="lastName" placeholder="Last Name" />

            <select v-model="genderValue" id="gender" placeholder="Select Gender"
                class="text-center w-96 rounded-md border p-2 text-gray-900 placeholder:text-gray-400 focus:ring-2 focus:ring-inset sm:text-sm sm:leading-6">
                <option disabled selected>Select Gender</option>
                <option value="0">Male</option>
                <option value="1">Female</option>
            </select>
            <BaseInput v-model="mobileNumber" placeholder="Mobile Number" type="Number" required />
            <VueDatePicker v-model="date" class="w-96" :enable-time-picker="false" placeholder="Select Birthdate">
            </VueDatePicker>

            <country-select v-model="country" :country="country" topCountry="PH" :autocomplete="true" :usei18n="false"
                class="w-96 rounded-md border p-2 text-gray-900  placeholder:text-gray-400 focus:ring-2 focus:ring-inset sm:text-sm sm:leading-6 text-center" />
            <region-select v-model="region" :country="country" :region="region" :regionName="true"
                class="w-96 rounded-md border p-2 text-gray-900 placeholder:text-gray-400 focus:ring-2 focus:ring-inset sm:text-sm sm:leading-6 text-center"
                :defaultRegion="'PH'" />
            <BaseInput v-model="locationCity" placeholder="City/Village/Subdivision" />

            <BaseInput v-model="school" placeholder="School" />
            <textarea v-model="bio" id="bio" placeholder="Bio"
                class="w-96 rounded-md border p-2 text-gray-900 placeholder:text-gray-400 focus:ring-2 focus:ring-inset sm:text-sm sm:leading-6 text-center"></textarea>
            <label for="gender_interest">Gender Interest</label>
            <select v-model="genderInterestValue" id="gender_interest"
                class="text-center w-96 rounded-md border p-2 text-gray-900 placeholder:text-gray-400 focus:ring-2 focus:ring-inset sm:text-sm sm:leading-6">
                <option value="none" selected disabled>Select an Gender Interest</option>
                <option value="0">Male</option>
                <option value="1">Female</option>
            </select>


            <button type="button" @click="onSubmit" class="py-2 px-4 text-sm bg-sky-500 text-white mt-8">
                REGISTER
            </button>
        </form>
    </div>
</template>
<script setup>
import VueDatePicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";
import { ref, computed } from 'vue';
import { useRouter } from "vue-router";
import BaseInput from '../components/BaseInput.vue';
import { useMutation } from "@vue/apollo-composable"
import CreateUserMutation from "../graphql/createUser.mutation.gql"
import { useAuthStore } from '../store/auth';

const authStore = useAuthStore();
const router = useRouter();
function convertDate(dateString) {
    if (dateString) {
        const dateObject = new Date(dateString);
        const formattedDate = dateObject.toISOString().substr(0, 10);
        return formattedDate;
    } return
}

const genderValue = computed({
    get: () => String(gender.value),
    set: (value) => {
        gender.value = parseInt(value);
    },
});

const genderInterestValue = computed({
    get: () => String(gender_interest.value),
    set: (value) => {
        gender_interest.value = parseInt(value);
    },
});

const { mutate: createUser, onDone, onError, error, result } = useMutation(CreateUserMutation, () => ({
    variables: {
        email: userEmail.value,
        password: userPassword.value,
        firstName: firstName.value,
        lastName: lastName.value,
        mobileNumber: parseInt(mobileNumber.value),
        birthdate: convertDate(date.value),
        gender: gender.value,
        locationCity: locationCity.value,
        locationState: region.value,
        locationCountry: country.value,
        school: school.value,
        bio: bio.value,
        gender_interest: gender_interest.value
    }
}))

const gender = ref(0)
const gender_interest = ref(0)
const userEmail = ref("");
const userPassword = ref("");
const firstName = ref("");
const lastName = ref("");
const mobileNumber = ref("");
const date = ref("");
const locationCity = ref("");
const country = ref("");
const region = ref("");
const school = ref("");
const bio = ref("");

const onSubmit = () => {
    createUser();
};

onDone(result => {
    const user = result.data.createUser.user;
    if (user) {
        console.log(user)
        authStore.setUser(user)
        localStorage.setItem('token', result.data.createUser.token)

        router.push({ name: "Swipe" });
    }
})

</script>