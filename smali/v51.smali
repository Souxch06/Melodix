.class public final synthetic Lv51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:Lhz0;

.field public final synthetic k:Landroid/content/Context;

.field public final synthetic l:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic m:Le2;

.field public final synthetic n:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Lhz0;Landroid/content/Context;Lcom/melodix/music/SettingsActivity$a;Le2;Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv51;->j:Lhz0;

    .line 5
    .line 6
    iput-object p2, p0, Lv51;->k:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lv51;->l:Lcom/melodix/music/SettingsActivity$a;

    .line 9
    .line 10
    iput-object p4, p0, Lv51;->m:Le2;

    .line 11
    .line 12
    iput-object p5, p0, Lv51;->n:Landroidx/preference/Preference;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4
    # Switching to a saved WebView session is intentionally unsupported.
    iget-object v0, p0, Lv51;->j:Lhz0;
    iget-object v0, v0, Lhz0;->j:Ljava/lang/Object;
    check-cast v0, Lg4;
    if-eqz v0, :dismissed
    invoke-virtual {v0}, Lg4;->dismiss()V
    :dismissed
    iget-object v1, p0, Lv51;->k:Landroid/content/Context;
    const-string v2, "Saved session switching is disabled. Sign in through Spotify's official page."
    const/4 v3, 0x1
    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    return-void
.end method
