IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[InsCategoria] 
GO 

CREATE PROCEDURE [dbo].[InsCategoria](
	@Nom_Categoria	varchar(150)
	)

	AS

	/*
		Documenta��o
		Arquivo Fonte.....: Categoria.sql
		Objetivo..........: Cadastra um novo Categoria no sistema
		Autor.............: Joyce Ribeiro
 		Data..............: 03/02/2020
		Coment�rios.......: Par�metro Status :
							0 - Processado OK
							1 - Erro ao inserir
	*/

	BEGIN 
		
		INSERT  INTO Categoria (Nom_Categoria)
			VALUES (@Nom_Categoria)

		RETURN 0
			
	END 
GO



IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelCategoria] 
GO 

CREATE PROCEDURE [dbo].[DelCategoria](
	@Num_Cat	varchar(11))

	AS
	/*
		Documenta��o
		Arquivo Fonte.....: Categoria.sql
		Objetivo..........: Remove uma determinada categoria
		Autor.............: Joyce Ribeiro
 		Data..............: 03/02/2020
		Coment�rios.......: Par�metro Status :
							0 - Processado OK
							1 - Erro ao excluir
		Ex................: EXEC [dbo].[GKSSP_SelSolicAbonos] 30004644, 2018, 10, '0'
	*/

	BEGIN
		DELETE FROM Categoria 
			WHERE Categoria.Num_IDCategoria = @Num_Cat
		RETURN 0
	END
GO




IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelCategoria] 
GO 

CREATE PROCEDURE [dbo].[SelCategoria](
	@Num_id	varchar(11) )

	AS
	/*
		Documenta��o
		Arquivo Fonte.....: Categoria.sql
		Objetivo..........: Seleciona uma ou todas as Categorias
		Autor.............: Joyce Ribeiro
 		Data..............: 03/02/2020
		Coment�rios.......: Par�metro Status :
							0 - Processado OK
							1 - Erro ao selecionar
		Ex................: EXEC [dbo].[GKSSP_SelSolicAbonos] 30004644, 2018, 10, '0'
	*/

	BEGIN

		SELECT Num_IDCategoria,
			Nom_Categoria
		FROM Categoria ct WITH(NOLOCK)
		WHERE ct.Num_IDCategoria = @Num_id
		
		RETURN 0
	END
GO