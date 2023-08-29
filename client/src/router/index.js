import SwipePage from "../views/SwipePage.vue";
import MatchPage from "../views/MatchPage.vue";
import { createRouter, createWebHistory } from "vue-router";
import App from "../App.vue";

const routes = [
  {
    path: "/swipe",
    name: "Swipe",
    component: SwipePage,
  },
  { path: "/match", name: "Match", component: MatchPage },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
