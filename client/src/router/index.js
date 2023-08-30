import SwipePage from "../views/SwipePage.vue";
import MatchPage from "../views/MatchPage.vue";
import SignUpPage from "../views/SignUpPage.vue";
import { createRouter, createWebHistory } from "vue-router";

const routes = [
  {
    path: "/swipe",
    name: "Swipe",
    component: SwipePage,
  },
  { path: "/match", name: "Match", component: MatchPage },
  { path: "/register", name: "Sign Up", component: SignUpPage },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
