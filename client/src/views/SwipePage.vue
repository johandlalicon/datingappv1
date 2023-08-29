<template>
    <div>
        <h1>SWIPE PAGE</h1>
        <template v-if="loading">
            <p>Loading...</p>
        </template>
        <template v-else>
            <ProfileCard v-for="profile in profiles" :key="profile.id" :firstName="profile.firstName"
                :locationCity="profile.locationCity" :locationCountry="profile.locationCountry"
                :locationState="profile.locationState" :lastName="profile.lastName" :bio="profile.bio" />

        </template>
    </div>
</template>
<script>
import ProfileCard from '../components/ProfileCard.vue';
import ListMatchQuery from '../graphql/findMatch.query.gql'
import { useQuery } from "@vue/apollo-composable"
import { ref, watch } from "vue";

export default {
    components: {
        ProfileCard
    },
    setup() {
        const profiles = ref([]);
        const { result, onResult, loading } = useQuery(ListMatchQuery, {}, { fetchPolicy: "cache-first" });

        const handleResult = (data) => {
            profiles.value = data?.findMatch || [];
            console.log(profiles.value);
        };

        // Watch for changes in the result
        watch(result, () => {
            // Handle the result
            if (!result.value) {
                return;
            }
            handleResult(result.value);
        }, {
            immediate: true
        });

        // Handle additional actions when data is returned from the server
        onResult(({ data }) => {
            console.log(data)
        });

        return {
            profiles,
            loading
        };
    }
};
</script>
<style></style>