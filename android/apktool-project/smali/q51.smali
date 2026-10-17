.class public final synthetic Lq51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic j:Landroid/widget/EditText;

.field public final synthetic k:Landroid/content/Context;

.field public final synthetic l:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/content/Context;Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lq51;->j:Landroid/widget/EditText;

    .line 5
    .line 6
    iput-object p2, p0, Lq51;->k:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lq51;->l:Landroidx/preference/Preference;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    iget-object p1, p0, Lq51;->j:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sput-object p1, Lcom/melodix/music/AppSingleton;->b0:Ljava/lang/String;

    .line 12
    .line 13
    sget p2, Lcom/melodix/music/AppSingleton;->j:I

    .line 14
    .line 15
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string v0, "key_custom_css"

    .line 20
    .line 21
    invoke-interface {p2, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 26
    .line 27
    .line 28
    sget-object p1, Lcom/melodix/music/AppSingleton;->b0:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p1}, Lm9;->h(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lq51;->l:Landroidx/preference/Preference;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/melodix/music/SettingsActivity$a;->S(Landroidx/preference/Preference;)V

    .line 36
    .line 37
    .line 38
    const-string p1, "Custom CSS injected!"

    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    iget-object p0, p0, Lq51;->k:Landroid/content/Context;

    .line 42
    .line 43
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 48
    .line 49
    .line 50
    return-void
.end method
