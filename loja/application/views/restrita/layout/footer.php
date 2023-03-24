<?php if ($this->router->fetch_class() != 'login'): ?>
    <?php if ($this->router->fetch_method() != 'imprimir'): ?>
        <?php if ($this->router->fetch_method() != 'diarias'): ?>
            <?php if ($this->router->fetch_method() != 'vendidos'): ?>

                <footer class="main-footer">
                    <div class="footer-left">
                        <a href="templateshub.net">Templateshub</a></a>
                    </div>
                    <div class="footer-right">
                    </div>
                </footer>

            <?php endif; ?>
        <?php endif; ?>
    <?php endif; ?>
<?php endif; ?>


</div>
</div>
<!-- General JS Scripts -->
<script src="<?php echo base_url('public/assets/js/app.min.js'); ?>"></script>
<!-- JS Libraies -->
<!-- Page Specific JS File -->
<!-- Template JS File -->
<script src="<?php echo base_url('public/assets/js/scripts.js'); ?>"></script>

<script src="<?php echo base_url('public/assets/js/util.js'); ?>"></script>

<script src="<?php echo base_url('public/assets/sweetalert2/sweetalert2.all.min.js'); ?>"></script>

<?php if (isset($scripts)): ?>

    <?php foreach ($scripts as $script): ?> 


        <script src="<?php echo base_url('public/assets/' . $script); ?>"></script>


    <?php endforeach; ?>

<?php endif; ?>

<script src="<?php echo base_url('public/assets/mask/custom.js'); ?>"></script>
<script src="<?php echo base_url('public/assets/mask/jquery.mask.min.js'); ?>"></script>




<!-- Custom JS File -->
<script src="<?php echo base_url('public/assets/js/custom.js'); ?>"></script>

<script src="<?php echo base_url('public/assets/jquery-upload-file/js/jquery.uploadfile.js'); ?>"></script>

<script src="<?php echo base_url('public/assets/jquery-upload-file/js/jquery.uploadfile.min.js'); ?>"></script>

<script src="<?php echo base_url('public/assets/jquery-upload-file/js/produtos.js'); ?>"></script>

<script>

    $('.delete').on("click", function (event) {

        event.preventDefault();

        var choice = confirm($(this).attr('data-confirm'));

        if (choice) {
            window.location.href = $(this).attr('href');
        }

    });

    $('#btn-atualizar-massa').on("click", function (event) {

        event.preventDefault();

        var choice = confirm($(this).attr('data-confirm'));

        if (choice) {
            window.location.href = $(this).attr('href');
        }

    });

</script>

</body>


<!-- blank.html  21 Nov 2019 03:54:41 GMT -->
</html>