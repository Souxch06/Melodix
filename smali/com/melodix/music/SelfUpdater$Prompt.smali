.class final Lcom/melodix/music/SelfUpdater$Prompt;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Dialogue "mise a jour disponible" affiche sur le fil UI.

.field private final activity:Landroid/app/Activity;

.field private final apk:Ljava/io/File;

.field private final tag:Ljava/lang/String;


.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/SelfUpdater$Prompt;->activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/melodix/music/SelfUpdater$Prompt;->tag:Ljava/lang/String;

    iput-object p3, p0, Lcom/melodix/music/SelfUpdater$Prompt;->apk:Ljava/io/File;

    return-void
.end method


.method public final run()V
    .locals 5

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/SelfUpdater$Prompt;->activity:Landroid/app/Activity;

    if-eqz v0, :done

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :done

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "La version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/melodix/music/SelfUpdater$Prompt;->tag:Ljava/lang/String;

    if-nez v2, :tag_ok

    const-string v2, "?"

    :tag_ok
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " est prete.\n\nInstallation : une seule confirmation Android sera demandee."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Mise a jour Melodix"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Mettre a jour"

    new-instance v3, Lcom/melodix/music/SelfUpdater$OnInstall;

    iget-object v4, p0, Lcom/melodix/music/SelfUpdater$Prompt;->apk:Ljava/io/File;

    invoke-direct {v3, v0, v4}, Lcom/melodix/music/SelfUpdater$OnInstall;-><init>(Landroid/app/Activity;Ljava/io/File;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Plus tard"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :done
    return-void
.end method
