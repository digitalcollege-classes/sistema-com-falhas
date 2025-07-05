<?php

declare(strict_types=1);

function hasLoggedUser(): bool
{
    // return isset($_SESSION['user']);

    if (isset($_SESSION['user'])) {
        return true;
    }

    return false;
}