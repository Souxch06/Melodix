.class public final synthetic Lb61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr80;


# instance fields
.field public final synthetic j:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic k:Landroid/content/Context;

.field public final synthetic l:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/SettingsActivity$a;Landroid/content/Context;Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lb61;->j:Lcom/melodix/music/SettingsActivity$a;

    .line 5
    .line 6
    iput-object p2, p0, Lb61;->k:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lb61;->l:Landroidx/preference/Preference;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    move-object v1, p1

    .line 2
    check-cast v1, Le2;

    .line 3
    .line 4
    iget-object v3, p0, Lb61;->j:Lcom/melodix/music/SettingsActivity$a;

    .line 5
    .line 6
    invoke-virtual {v3}, Lh70;->g()Le6;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    new-instance v0, Lxv;

    .line 13
    .line 14
    const/4 v5, 0x1

    .line 15
    iget-object v2, p0, Lb61;->k:Landroid/content/Context;

    .line 16
    .line 17
    iget-object v4, p0, Lb61;->l:Landroidx/preference/Preference;

    .line 18
    .line 19
    invoke-direct/range {v0 .. v5}, Lxv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    sget-object p0, Lwe1;->a:Lwe1;

    .line 26
    .line 27
    return-object p0
.end method
