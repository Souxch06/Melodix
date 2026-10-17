.class public final synthetic Li61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Z

.field public final synthetic k:Landroid/content/Context;

.field public final synthetic l:Le2;

.field public final synthetic m:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic n:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(ZLandroid/content/Context;Le2;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Li61;->j:Z

    .line 5
    .line 6
    iput-object p2, p0, Li61;->k:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Li61;->l:Le2;

    .line 9
    .line 10
    iput-object p4, p0, Li61;->m:Lcom/melodix/music/SettingsActivity$a;

    .line 11
    .line 12
    iput-object p5, p0, Li61;->n:Landroidx/preference/Preference;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Li61;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Li61;->l:Le2;

    .line 6
    .line 7
    iget-object v0, v0, Le2;->b:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "Switched to "

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    iget-object v2, p0, Li61;->k:Landroid/content/Context;

    .line 25
    .line 26
    invoke-static {v2, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Li61;->m:Lcom/melodix/music/SettingsActivity$a;

    .line 34
    .line 35
    iget-object p0, p0, Li61;->n:Landroidx/preference/Preference;

    .line 36
    .line 37
    invoke-static {v0, p0}, Lcom/melodix/music/SettingsActivity$a;->R(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Lh70;->g()Le6;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
