<template>
    <div>
        <h1>MATCH PAGE</h1>
        <template v-if="loading">
            <p>Loading...</p>
        </template>
        <template v-else>
            <ProfileCard v-for="profile in profiles" :key="profile.id" :firstName="profile.firstName" :userId="profile.id"
                :locationCity="profile.locationCity" :locationCountry="profile.locationCountry"
                :locationState="profile.locationState" :lastName="profile.lastName" :bio="profile.bio" />

        </template>
    </div>
</template>
<script>
import ProfileCard from '../components/ProfileCard.vue';
import MutualUsersQuery from '../graphql/mutualLike.query.gql'
import { useQuery } from "@vue/apollo-composable"
import { ref, watch } from "vue";

export default {
    components: {
        ProfileCard
    },
    setup() {
        const profiles = ref([]);
        const { result, onResult, loading } = useQuery(MutualUsersQuery, {});

        const handleResult = (data) => {
            profiles.value = data?.mutualUsers || [];
            console.log(profiles.value);
        };


        watch(result, () => {

            if (!result.value) {
                return;
            }
            handleResult(result.value);
        }, {
            immediate: true
        });


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