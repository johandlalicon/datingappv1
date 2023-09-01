import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import graphql from "@rollup/plugin-graphql";

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    host: "localhost",
    port: 5199,
  },
  plugins: [vue(), graphql()],
});
