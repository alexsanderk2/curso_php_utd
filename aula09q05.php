<?php 

	if (isset($_GET['form'])){$form = $_GET['form'];}
	if (isset($_GET['form1'])){$form = $_GET['form1'];}
?>

<!DOCTYPE html>
<html>

	<head>
		<title>Criação do Formulario</title>
	</head>

<body>

	<?php if (isset($_GET['meuform0'])){

		echo '<form>';
		
		for ($i=0; $i < $form; $i++) { 
			?>
			
			<div>
				<h3> Digite <?php echo $_GET['meuform'.$i.'']; ?> </h3>
				
				<?php 

				echo '<input type="text" name="meuform'.$i.'">'

				?>
			</div>
			
			<?php 
			} ?>
		<br>
		<br>
		<button type="submit">Finalize seu Cadastro!!</button>
		</form>
	<?php 
	
} elseif (isset($_GET['form'])){

		echo '<form method="GET">';
		echo '<input type="hidden" name="form1" value="'.$form.'">';

		for ($i=0; $i < $form; $i++) { 
			?>
			<div>
				<h3> Nome do campo </h3>

				<?php echo '<input type="text" name="meuform'.$i.'">'
				?>

			</div>

	<?php 

} ?>
		<br>
		<br>
		<button type="submit">Criação do Formulario</button>
		</form>
	<?php 

}else{ 

	?>

	<form method="GET">

		<h3> Quantidade de campos </h3>

			<input type="number" name="form">
			<button type="submit">Enumerar</button>

	</form>
	<?php 
}	?>

</body>
</html>