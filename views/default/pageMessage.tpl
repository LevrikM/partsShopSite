<div class="text-center">
        {if $action == "auth"}
                {if $status == "success"}
                        <script>
                            localStorage.setItem('isLoggedIn', 'true');
                            localStorage.setItem('userEmail', '{$userEmail}');
                            localStorage.setItem('admin', '{$admin}');
                        </script>
                        <i class="fas fa-check" style="color: #17c10b;"></i><br>
                        <span>Авторизація успішна!</span><br>
                        <a class="btn btn-primary mt-5" href="http://auto/">На головну</a>
        {else}
                        <i class="fas fa-exclamation-circle fa-lg" style="color: #b80000;"></i><br>
                        <span>Помилка при авторизації!</span><br>
                        <span><b>{$status}</b></span><br>
                        <span>Перевірте правильність даних та спробуйте знову</span><br>
                        <a class="btn btn-primary mt-5" href="http://auto/user/auth/">Спробувати ще раз</a>
                        <a class="btn btn-secondary mt-5" href="http://auto/">На головну</a>

        {/if}
        {elseif ($action == "register")}
                {if $status == "success"}
                        <i class="fas fa-check" style="color: #17c10b;"></i><br>
                        <span>Реєстрація успішна!</span><br>
                        <span>Використовуйте дані для входу на сторінку</span><br>
                        <a class="btn btn-primary mt-5" href="http://auto/user/auth/">Авторизація</a>
        {else}
                        <i class="fas fa-exclamation-circle fa-lg" style="color: #b80000;"></i><br>
                        <span>Помилка при реєстрації</span><br>
                        <span><b>{$status}</b></span><br>
                        <span>Перевірте правильність даних та спробуйте знову</span><br>
                        <a class="btn btn-primary mt-5" href="http://auto/user/registration/">Спробувати ще раз</a>
                        <a class="btn btn-secondary mt-5" href="http://auto/">На головну</a>
                {/if}
        {elseif ($action == "exit")}
            <script>
                localStorage.clear();
            </script>
            <i class="fas fa-check" style="color: #17c10b;"></i><br>
            <span>Вихід успішно виконаний, до зустрічі!</span><br>
            <a class="btn btn-primary mt-4" href="http://auto/">На головну</a>
        {elseif $action == "part"}
            {if $status == "success"}
                <i class="fas fa-check" style="color: #17c10b;"></i><br>
                <span>Запчастина <b>{$partName}</b> успішно додана!</span><br>
                <a class="btn btn-primary mt-3" href="http://auto/">На головну</a>
            {else}
                <i class="fas fa-exclamation-circle fa-lg" style="color: #b80000;"></i><br>
                <span>Запчастина <b>{$partName}</b> не додана!</span><br>
                <span>Перевірте правильність даних та спробуйте знову</span><br>
                <span><b>{$status}</b></span><br>
                <a class="btn btn-primary mt-3" href="http://auto/part/add/">Спробувати ще раз</a>
                <a class="btn btn-secondary mt-3" href="http://auto/">На головну</a>
            {/if}
        {elseif $action == "order"}
            {if $status == "success"}
                <i class="fas fa-check" style="color: #17c10b;"></i><br>
                <span>Запчастина <b>{$partName}</b> успішно замовлена!</span><br>
                <span>Очікуйте дзвінка для підтвердження замовлення!</span><br>
                <a class="btn btn-primary mt-3" href="http://auto/">На головну</a>
            {else}
                <i class="fas fa-exclamation-circle fa-lg" style="color: #b80000;"></i><br>
                <span>Запчастина <b>{$partName}</b> не замовлена!</span><br>
                <span>Перевірте правильність даних та спробуйте знову</span><br>
                <a class="btn btn-secondary mt-3" href="http://auto/">На головну</a>
            {/if}
        {/if}
</div>




