.class public final synthetic Lu51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic j:Landroid/widget/EditText;

.field public final synthetic k:Landroid/content/Context;

.field public final synthetic l:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic m:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/content/Context;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lu51;->j:Landroid/widget/EditText;

    .line 5
    .line 6
    iput-object p2, p0, Lu51;->k:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lu51;->l:Lcom/melodix/music/SettingsActivity$a;

    .line 9
    .line 10
    iput-object p4, p0, Lu51;->m:Landroidx/preference/Preference;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
# Session saving is disabled: no cookie or profile data is read or written.
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lu51;->k:Landroid/content/Context;

    const-string v1, "Session saving is disabled"

    const/4 p1, 0x1

    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method
