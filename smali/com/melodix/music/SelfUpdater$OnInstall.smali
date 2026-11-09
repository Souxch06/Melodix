.class final Lcom/melodix/music/SelfUpdater$OnInstall;
.super Ljava/lang/Object;
.implements Landroid/content/DialogInterface$OnClickListener;

# Bouton "Mettre a jour" : lance l'installation du fichier deja verifie.

.field private final activity:Landroid/app/Activity;

.field private final apk:Ljava/io/File;


.method public constructor <init>(Landroid/app/Activity;Ljava/io/File;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/SelfUpdater$OnInstall;->activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/melodix/music/SelfUpdater$OnInstall;->apk:Ljava/io/File;

    return-void
.end method


.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p1, p0, Lcom/melodix/music/SelfUpdater$OnInstall;->activity:Landroid/app/Activity;

    iget-object p2, p0, Lcom/melodix/music/SelfUpdater$OnInstall;->apk:Ljava/io/File;

    if-eqz p1, :done

    if-eqz p2, :done

    invoke-static {}, Lcom/melodix/music/NativeSessionRecovery;->flushForUpdate()Z
    move-result v0
    if-nez v0, :flush_ok
    const-string p2, "Mise à jour reportée : impossible de sauvegarder la session. Réessaie."
    const/4 v0, 0x1
    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p2
    invoke-virtual {p2}, Landroid/widget/Toast;->show()V
    goto :done
    :flush_ok
    invoke-static {p1, p2}, Lcom/melodix/music/SelfUpdater;->install(Landroid/content/Context;Ljava/io/File;)V

    :done
    return-void
.end method
