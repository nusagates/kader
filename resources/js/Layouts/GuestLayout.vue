<script setup>
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <v-app>
        <div class="mx-auto w-100 h-100 bg-grey-lighten-3">
            <div class="d-flex justify-center">
                <Link href="/">
                <ApplicationLogo style="width: 150px;" />
                </Link>
            </div>

            <div class="mx-6 py-2">
                <slot />
            </div>
        </div>
    </v-app>
</template>
