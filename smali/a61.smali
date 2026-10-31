.class public final synthetic La61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic l:Landroidx/preference/Preference;

.field public final synthetic m:Ljava/lang/Object;

.field public final synthetic n:Ljava/lang/Object;

.field public final synthetic o:Ljava/io/Serializable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;I)V
    .locals 0

    .line 1
    iput p6, p0, La61;->j:I

    .line 2
    .line 3
    iput-object p1, p0, La61;->m:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p2, p0, La61;->n:Ljava/lang/Object;

    .line 6
    .line 7
    iput-object p3, p0, La61;->o:Ljava/io/Serializable;

    .line 8
    .line 9
    iput-object p4, p0, La61;->k:Lcom/melodix/music/SettingsActivity$a;

    .line 10
    .line 11
    iput-object p5, p0, La61;->l:Landroidx/preference/Preference;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
# Profile deletion is disabled: the object is only type-checked here and
# no files were changed.
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v1, p0, La61;->m:Ljava/lang/Object;

    check-cast v1, Lhz0;

    const-string p1, "No files were changed"

    sget-object p2, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    if-eqz p2, :done

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/melodix/music/MainActivity;

    if-eqz p2, :done

    const/4 v0, 0x1

    invoke-static {p2, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :done
    return-void
.end method
