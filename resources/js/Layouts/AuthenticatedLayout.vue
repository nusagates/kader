<template>
    <v-app>
        <div class="h-100 bg-grey-lighten-3">
            <v-app-bar>
                <template #prepend>
                    <ApplicationLogo style="max-width: 50px"/>
                </template>
                <v-app-bar-title>Pengelolaan Kader</v-app-bar-title>
                <v-spacer/>
                <v-btn @click="drawer=!drawer" icon>
                    <v-icon>mdi-menu</v-icon>
                </v-btn>
            </v-app-bar>
            <v-main class="mx-2 my-3">
                <slot/>
            </v-main>
        </div>
        <v-navigation-drawer location="right" v-model="drawer">
            <v-list-item :title="$page.props.auth.user.name" :subtitle="$page.props.auth.user.email"></v-list-item>
            <v-divider></v-divider>
            <v-list-item prepend-icon="mdi-home" target="_blank" href="https://mwcnusidomukti.com" title="Portal Situs"></v-list-item>
            <v-list-item prepend-icon="mdi-account-multiple" @click="router.visit('/member')" title="Data kader"></v-list-item>
            <template v-slot:append>
                <div class="pa-2">
                    <v-btn @click="router.post('logout')" block>
                        Logout
                    </v-btn>
                </div>
            </template>
        </v-navigation-drawer>
    </v-app>
</template>

<script setup>
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import {ref} from "vue";
import {router} from "@inertiajs/vue3";

const drawer = ref(false)

</script>

<style>
html {
    overflow-y: auto
}
</style>
