.class public final Lke0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lle0;


# instance fields
.field public final j:Landroid/view/inputmethod/InputContentInfo;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Landroid/content/ClipDescription;Landroid/net/Uri;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/inputmethod/InputContentInfo;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2, p3}, Landroid/view/inputmethod/InputContentInfo;-><init>(Landroid/net/Uri;Landroid/content/ClipDescription;Landroid/net/Uri;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lke0;->j:Landroid/view/inputmethod/InputContentInfo;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    check-cast p1, Landroid/view/inputmethod/InputContentInfo;

    iput-object p1, p0, Lke0;->j:Landroid/view/inputmethod/InputContentInfo;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lke0;->j:Landroid/view/inputmethod/InputContentInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lke0;->j:Landroid/view/inputmethod/InputContentInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/inputmethod/InputContentInfo;->getContentUri()Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lke0;->j:Landroid/view/inputmethod/InputContentInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/inputmethod/InputContentInfo;->requestPermission()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lke0;->j:Landroid/view/inputmethod/InputContentInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/inputmethod/InputContentInfo;->getLinkUri()Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final getDescription()Landroid/content/ClipDescription;
    .locals 0

    .line 1
    iget-object p0, p0, Lke0;->j:Landroid/view/inputmethod/InputContentInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/inputmethod/InputContentInfo;->getDescription()Landroid/content/ClipDescription;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
