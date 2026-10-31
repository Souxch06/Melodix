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

    invoke-static {p1, p2}, Lcom/melodix/music/SelfUpdater;->install(Landroid/content/Context;Ljava/io/File;)V

    :done
    return-void
.end method
