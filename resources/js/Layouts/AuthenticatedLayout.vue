<script setup>
import { ref } from 'vue';
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import Dropdown from '@/Components/Dropdown.vue';
import DropdownLink from '@/Components/DropdownLink.vue';
import NavLink from '@/Components/NavLink.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';
import { Link } from '@inertiajs/vue3';

const showingNavigationDropdown = ref(false);
</script>

<template>
    <v-app>
        <div class="h-100 bg-grey-lighten-3">
            <v-app-bar>
                <template #prepend>
                    <ApplicationLogo />
                </template>
                <v-app-bar-title>Pengelolaan Kader</v-app-bar-title>
                <v-spacer />
                <v-btn icon>
                    <v-icon>mdi-menu</v-icon>
                </v-btn>
            </v-app-bar>
            <v-main class="mx-2 my-3">
                <slot />
            </v-main>
        </div>
    </v-app>
</template>
<style>
html { overflow-y: auto }
</style>