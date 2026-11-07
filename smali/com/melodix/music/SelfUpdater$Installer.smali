.class final Lcom/melodix/music/SelfUpdater$Installer;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Fil dedie a l'installation silencieuse : ne bloque jamais le fil UI.

.field private final apk:Ljava/io/File;

.field private final ctx:Landroid/content/Context;


.method public constructor <init>(Landroid/content/Context;Ljava/io/File;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/SelfUpdater$Installer;->ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/melodix/music/SelfUpdater$Installer;->apk:Ljava/io/File;

    return-void
.end method


.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/melodix/music/SelfUpdater$Installer;->ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/melodix/music/SelfUpdater$Installer;->apk:Ljava/io/File;

    if-eqz v0, :done

    if-eqz v1, :done

    invoke-static {v0, v1}, Lcom/melodix/music/SelfUpdater;->install(Landroid/content/Context;Ljava/io/File;)V

    :done
    return-void
.end method
