IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[InsAlimento] 
GO 

CREATE PROCEDURE [dbo].[InsAlimento](
	@Nom_Alimento		varchar(20),
	@Num_IDCategoria	int
	)

	AS

	/*
		Documenta��o
		Arquivo Fonte.....: Alimento.sql
		Objetivo..........: Cadastra um novo Alimento no sistema
		Autor.............: Joyce Ribeiro
 		Data..............: 03/02/2020
		Coment�rios.......: Par�metro Status :
							0 - Processado OK
							1 - Erro ao inserir
		Ex................: EXEC InsAlimento 'Arroz branco', 1, '0' 
	*/

	BEGIN 
		
		INSERT  INTO Alimento (Nom_Alimento, Num_IDCategoria, Ind_Ativo)
			VALUES (@Nom_Alimento, @Num_IDCategoria, NULL)

		RETURN 0
			
	END 
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelAlimento] 
GO 

CREATE PROCEDURE [dbo].[DelAlimento](
	@Nom_id	varchar(11))

	AS
	/*
		Documenta��o
		Arquivo Fonte.....: Alimento.sql
		Objetivo..........: Remove um determinado Alimento
		Autor.............: Joyce Ribeiro
 		Data..............: 03/02/2020
		Coment�rios.......: Par�metro Status :
							0 - Processado OK
							1 - Erro ao excluir
		Ex................: EXEC DelAlimento '1'
	*/

	BEGIN
		DELETE FROM Alimento 
			WHERE Alimento.Num_IDAlimento = @Nom_id
		RETURN 0
	END
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[AltAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[AltAlimento] 
GO 

CREATE PROCEDURE [dbo].[AltAlimento](
	@Num_IDAlimento		int,
	@Ind_Ativo			date)

	AS
	/*
		Documenta��o
		Arquivo Fonte.....: Alimento.sql
		Objetivo..........: Altera um determinado Alimento
		Autor.............: Joyce Ribeiro
 		Data..............: 03/02/2020
		Coment�rios.......: Par�metro Status :
							0 - Processado OK
							1 - Erro ao excluir
	*/

	BEGIN
		UPDATE Alimento 
			SET Ind_Ativo = @Ind_Ativo
			WHERE Alimento.Num_IDAlimento = @Num_IDAlimento
		RETURN 0
	END
GO



IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelAlimento] 
GO 

CREATE PROCEDURE [dbo].[SelAlimento](
	@Num_id	varchar(11) )

	AS
	/*
		Documenta��o
		Arquivo Fonte.....: Alimento.sql
		Objetivo..........: Seleciona um ou todos os Alimentos
		Autor.............: Joyce Ribeiro
 		Data..............: 03/02/2020
		Coment�rios.......: Par�metro Status :
							0 - Processado OK
							1 - Erro ao selecionar
		Ex................: EXEC SelAlimento '0'
	*/

	BEGIN
		IF @Num_id = '0'
			BEGIN
				SELECT Num_IDAlimento,
					Nom_Alimento,
					Num_IDCategoria,
					Ind_Ativo
				FROM Alimento WITH(NOLOCK)
			END
		ELSE
			BEGIN
				SELECT Num_IDAlimento,
					Nom_Alimento,
					Num_IDCategoria,
					Ind_Ativo
				FROM Alimento al WITH(NOLOCK)
				WHERE cast(al.Ind_Ativo as date) = cast(getDate() as date)
			END

		RETURN 0
	END
GO