import { createStore } from "vuex";

const store = createStore({
  state() {
    return {
      user: null, // Initialize user as null or an empty object depending on your use case
    };
  },
  mutations: {
    setUserId(state, userId) {
      state.user = userId; // Update the user state with the provided user ID
    },
  },
  actions: {
    saveUser({ commit }, userId) {
      // Pass userId as a parameter
      commit("setUserId", userId); // Commit the mutation to update the user ID in the state
    },
  },
});

export default store;
