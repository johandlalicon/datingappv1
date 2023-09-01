import { createApp, provide, h } from "vue";
import App from "./App.vue";
import router from "./router";
import { createPinia } from "pinia";
import vueCountryRegionSelect from "vue3-country-region-select";

import "./style.css";
import "./index.css";

import { setContext } from "@apollo/client/link/context";

import {
  ApolloClient,
  createHttpLink,
  InMemoryCache,
} from "@apollo/client/core";

import { DefaultApolloClient } from "@vue/apollo-composable";

const httpLink = createHttpLink({
  uri: "https://datingtestapp.onrender.com/",
});

const authLink = setContext((_, { headers }) => {
  const token = localStorage.getItem("token");
  return {
    headers: {
      ...headers,
      Authorization: token ? `Bearer ${token}` : "",
    },
  };
});

const cache = new InMemoryCache();

const apolloClient = new ApolloClient({
  link: authLink.concat(httpLink),
  cache,
});

const app = createApp({
  setup() {
    provide(DefaultApolloClient, apolloClient);
  },

  render: () => h(App),
});

const pinia = createPinia();
app.use(vueCountryRegionSelect);
app.use(router);
app.use(pinia).mount("#app");
