<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="/user/find/" method="GET">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name= "nameFind" placeholder="Введіть ім'я" aria-label="Пошук" required>
                    <span class="input-group-append">
                        <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                    </span>
                </div>
            </form>
        </div>
    </div>
    {if {$action == "users"}}
        <h1>Список користувачів</h1>
    {else}
        <h1>Результат за пошуком '{$findName}' : <span class="text-muted">{$users|@count}шт.</span></h1>
    {/if}
    {if $users|@count == 0}
        <h1>Нажаль, користувачів за таким критерієм не знайдено.</span></h1>
    {else}
        <table class="table text-center">
            <thead>
            <tr>
                <th>ID</th>
                <th>Ім'я</th>
                <th>Email</th>
                <th>Телефон</th>
                <th>Кількість замовлень</th>
                <th>Дата реєстрації</th>
            </tr>
            </thead>
            <tbody>
                {foreach $users as $user}
                    <tr>
                            <td>
                                <a href="http://auto/user/cabinet/?userId={$user['id']}">
                                    {$user['id']}
                                </a>
                            </td>
                            </td>
                            </td>
                            <td>{$user['name']}</td>
                            <td>{$user['email']}</td>
                            <td>{$user['phone']}</td>
                            <td>
                                <a href="http://auto/user/orders/?user_id={$user['id']}">
                                    {$user['total_orders']}
                                </a>
                            </td>
                            <td>{$user['date_register']}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    {/if}

</div>