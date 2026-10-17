.class public final Ll7;
.super Landroid/widget/EditText;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lbs0;


# instance fields
.field public final j:Ls3;

.field public final k:Lp8;

.field public final l:Ls7;

.field public final m:Lzb1;

.field public final n:Ls7;

.field public o:Lk7;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lpc1;->a(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f040196

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p0, p1}, Lac1;->a(Landroid/view/View;Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Ls3;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ls3;-><init>(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll7;->j:Ls3;

    .line 23
    .line 24
    invoke-virtual {p1, p2, v0}, Ls3;->l(Landroid/util/AttributeSet;I)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Lp8;

    .line 28
    .line 29
    invoke-direct {p1, p0}, Lp8;-><init>(Landroid/widget/TextView;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll7;->k:Lp8;

    .line 33
    .line 34
    invoke-virtual {p1, p2, v0}, Lp8;->f(Landroid/util/AttributeSet;I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lp8;->b()V

    .line 38
    .line 39
    .line 40
    new-instance p1, Ls7;

    .line 41
    .line 42
    const/4 v1, 0x6

    .line 43
    invoke-direct {p1, v1}, Ls7;-><init>(I)V

    .line 44
    .line 45
    .line 46
    iput-object p0, p1, Ls7;->k:Ljava/lang/Object;

    .line 47
    .line 48
    iput-object p1, p0, Ll7;->l:Ls7;

    .line 49
    .line 50
    new-instance p1, Lzb1;

    .line 51
    .line 52
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Ll7;->m:Lzb1;

    .line 56
    .line 57
    new-instance p1, Ls7;

    .line 58
    .line 59
    const/4 v1, 0x5

    .line 60
    invoke-direct {p1, p0, v1}, Ls7;-><init>(Landroid/widget/EditText;I)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Ll7;->n:Ls7;

    .line 64
    .line 65
    invoke-virtual {p1, p2, v0}, Ls7;->z(Landroid/util/AttributeSet;I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/widget/TextView;->getKeyListener()Landroid/text/method/KeyListener;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    instance-of v0, p2, Landroid/text/method/NumberKeyListener;

    .line 73
    .line 74
    if-nez v0, :cond_1

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->isFocusable()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {p0}, Landroid/view/View;->isLongClickable()Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    invoke-virtual {p0}, Landroid/widget/TextView;->getInputType()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-virtual {p1, p2}, Ls7;->w(Landroid/text/method/KeyListener;)Landroid/text/method/KeyListener;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    if-ne p1, p2, :cond_0

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TextView;->setKeyListener(Landroid/text/method/KeyListener;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setRawInputType(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusable(Z)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, v2}, Landroid/view/View;->setLongClickable(Z)V

    .line 112
    .line 113
    .line 114
    :cond_1
    :goto_0
    return-void
.end method

.method private getSuperCaller()Lk7;
    .locals 1

    .line 1
    iget-object v0, p0, Ll7;->o:Lk7;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lk7;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lk7;-><init>(Ll7;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll7;->o:Lk7;

    .line 11
    .line 12
    :cond_0
    return-object v0
.end method


# virtual methods
.method public final a(Lzp;)Lzp;
    .locals 1

    .line 1
    iget-object v0, p0, Ll7;->m:Lzb1;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lzb1;->a(Landroid/view/View;Lzp;)Lzp;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final drawableStateChanged()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll7;->j:Ls3;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ls3;->a()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll7;->k:Lp8;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lp8;->b()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public getCustomSelectionActionModeCallback()Landroid/view/ActionMode$Callback;
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/TextView;->getCustomSelectionActionModeCallback()Landroid/view/ActionMode$Callback;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lst;->w(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode$Callback;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll7;->j:Ls3;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ls3;->h()Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .locals 0

    .line 1
    iget-object p0, p0, Ll7;->j:Ls3;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ls3;->i()Landroid/graphics/PorterDuff$Mode;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getSupportCompoundDrawablesTintList()Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll7;->k:Lp8;

    .line 2
    .line 3
    invoke-virtual {p0}, Lp8;->d()Landroid/content/res/ColorStateList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSupportCompoundDrawablesTintMode()Landroid/graphics/PorterDuff$Mode;
    .locals 0

    .line 1
    iget-object p0, p0, Ll7;->k:Lp8;

    .line 2
    .line 3
    invoke-virtual {p0}, Lp8;->e()Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getText()Landroid/text/Editable;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public bridge synthetic getText()Ljava/lang/CharSequence;
    .locals 0

    .line 17
    invoke-virtual {p0}, Ll7;->getText()Landroid/text/Editable;

    move-result-object p0

    return-object p0
.end method

.method public getTextClassifier()Landroid/view/textclassifier/TextClassifier;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-ge v0, v1, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ll7;->l:Ls7;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, v0, Ls7;->l:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Landroid/view/textclassifier/TextClassifier;

    .line 15
    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    iget-object p0, v0, Ls7;->k:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-static {p0}, Lj8;->a(Landroid/widget/TextView;)Landroid/view/textclassifier/TextClassifier;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_1
    return-object p0

    .line 27
    :cond_2
    :goto_0
    invoke-direct {p0}, Ll7;->getSuperCaller()Lk7;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object p0, p0, Lk7;->a:Ll7;

    .line 32
    .line 33
    invoke-super {p0}, Landroid/widget/EditText;->getTextClassifier()Landroid/view/textclassifier/TextClassifier;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public final onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll7;->k:Lp8;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0, p0}, Lp8;->h(Landroid/view/inputmethod/EditorInfo;Landroid/view/inputmethod/InputConnection;Landroid/widget/TextView;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, v0, p0}, Les0;->k(Landroid/view/inputmethod/EditorInfo;Landroid/view/inputmethod/InputConnection;Landroid/widget/TextView;)V

    .line 14
    .line 15
    .line 16
    if-eqz v0, :cond_8

    .line 17
    .line 18
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 19
    .line 20
    const/16 v2, 0x1e

    .line 21
    .line 22
    if-gt v1, v2, :cond_8

    .line 23
    .line 24
    invoke-static {p0}, Lzh1;->e(Ll7;)[Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eqz v2, :cond_8

    .line 29
    .line 30
    const-string v3, "android.support.v13.view.inputmethod.EditorInfoCompat.CONTENT_MIME_TYPES"

    .line 31
    .line 32
    const-string v4, "androidx.core.view.inputmethod.EditorInfoCompat.CONTENT_MIME_TYPES"

    .line 33
    .line 34
    const/16 v5, 0x19

    .line 35
    .line 36
    if-lt v1, v5, :cond_0

    .line 37
    .line 38
    invoke-static {p1, v2}, Lqz;->a(Landroid/view/inputmethod/EditorInfo;[Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v6, p1, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 43
    .line 44
    if-nez v6, :cond_1

    .line 45
    .line 46
    new-instance v6, Landroid/os/Bundle;

    .line 47
    .line 48
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v6, p1, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 52
    .line 53
    :cond_1
    invoke-virtual {v6, v4, v2}, Landroid/os/BaseBundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v6, p1, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 57
    .line 58
    invoke-virtual {v6, v3, v2}, Landroid/os/BaseBundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    new-instance v2, Lfj;

    .line 62
    .line 63
    const/4 v6, 0x6

    .line 64
    invoke-direct {v2, v6, p0}, Lfj;-><init>(ILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    if-lt v1, v5, :cond_2

    .line 68
    .line 69
    new-instance v1, Lie0;

    .line 70
    .line 71
    invoke-direct {v1, v0, v2}, Lie0;-><init>(Landroid/view/inputmethod/InputConnection;Lfj;)V

    .line 72
    .line 73
    .line 74
    :goto_1
    move-object v0, v1

    .line 75
    goto :goto_4

    .line 76
    :cond_2
    sget-object v6, Lkn1;->a:[Ljava/lang/String;

    .line 77
    .line 78
    if-lt v1, v5, :cond_3

    .line 79
    .line 80
    invoke-static {p1}, Lqz;->b(Landroid/view/inputmethod/EditorInfo;)[Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    if-eqz v1, :cond_6

    .line 85
    .line 86
    :goto_2
    move-object v6, v1

    .line 87
    goto :goto_3

    .line 88
    :cond_3
    iget-object v1, p1, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 89
    .line 90
    if-nez v1, :cond_4

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_4
    invoke-virtual {v1, v4}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    if-nez v1, :cond_5

    .line 98
    .line 99
    iget-object v1, p1, Landroid/view/inputmethod/EditorInfo;->extras:Landroid/os/Bundle;

    .line 100
    .line 101
    invoke-virtual {v1, v3}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    :cond_5
    if-eqz v1, :cond_6

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_6
    :goto_3
    array-length v1, v6

    .line 109
    if-nez v1, :cond_7

    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_7
    new-instance v1, Lje0;

    .line 113
    .line 114
    invoke-direct {v1, v0, v2}, Lje0;-><init>(Landroid/view/inputmethod/InputConnection;Lfj;)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_8
    :goto_4
    iget-object p0, p0, Ll7;->n:Ls7;

    .line 119
    .line 120
    invoke-virtual {p0, v0, p1}, Ls7;->A(Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)Lf00;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0
.end method

.method public final onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x1e

    .line 7
    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    const/16 v1, 0x21

    .line 11
    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "input_method"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final onDragEvent(Landroid/view/DragEvent;)Z
    .locals 5

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-ge v0, v1, :cond_5

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_5

    .line 14
    .line 15
    invoke-static {p0}, Lzh1;->e(Ll7;)[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    instance-of v1, v0, Landroid/content/ContextWrapper;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    instance-of v1, v0, Landroid/app/Activity;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    check-cast v0, Landroid/app/Activity;

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    check-cast v0, Landroid/content/ContextWrapper;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v0, 0x0

    .line 45
    :goto_1
    if-nez v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_3
    invoke-virtual {p1}, Landroid/view/DragEvent;->getAction()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-ne v1, v2, :cond_4

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_4
    invoke-virtual {p1}, Landroid/view/DragEvent;->getAction()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    const/4 v4, 0x3

    .line 63
    if-ne v1, v4, :cond_5

    .line 64
    .line 65
    invoke-static {p1, p0, v0}, Lv7;->a(Landroid/view/DragEvent;Landroid/widget/TextView;Landroid/app/Activity;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    :cond_5
    :goto_2
    if-eqz v3, :cond_6

    .line 70
    .line 71
    return v2

    .line 72
    :cond_6
    invoke-super {p0, p1}, Landroid/view/View;->onDragEvent(Landroid/view/DragEvent;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0
.end method

.method public final onTextContextMenuItem(I)Z
    .locals 6

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    if-ge v0, v1, :cond_5

    .line 6
    .line 7
    invoke-static {p0}, Lzh1;->e(Ll7;)[Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    if-eqz v2, :cond_5

    .line 12
    .line 13
    const v2, 0x1020022

    .line 14
    .line 15
    .line 16
    if-eq p1, v2, :cond_0

    .line 17
    .line 18
    const v3, 0x1020031

    .line 19
    .line 20
    .line 21
    if-eq p1, v3, :cond_0

    .line 22
    .line 23
    goto :goto_3

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    const-string v4, "clipboard"

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Landroid/content/ClipboardManager;

    .line 35
    .line 36
    if-nez v3, :cond_1

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {v3}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    :goto_0
    const/4 v4, 0x1

    .line 45
    if-eqz v3, :cond_4

    .line 46
    .line 47
    invoke-virtual {v3}, Landroid/content/ClipData;->getItemCount()I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-lez v5, :cond_4

    .line 52
    .line 53
    if-lt v0, v1, :cond_2

    .line 54
    .line 55
    new-instance v0, Lpa0;

    .line 56
    .line 57
    invoke-direct {v0, v3, v4}, Lpa0;-><init>(Landroid/content/ClipData;I)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    new-instance v0, Lxp;

    .line 62
    .line 63
    invoke-direct {v0}, Lxp;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v3, v0, Lxp;->k:Landroid/content/ClipData;

    .line 67
    .line 68
    iput v4, v0, Lxp;->l:I

    .line 69
    .line 70
    :goto_1
    if-ne p1, v2, :cond_3

    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    goto :goto_2

    .line 74
    :cond_3
    move p1, v4

    .line 75
    :goto_2
    invoke-interface {v0, p1}, Lwp;->setFlags(I)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v0}, Lwp;->build()Lzp;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p0, p1}, Lzh1;->g(Landroid/view/View;Lzp;)Lzp;

    .line 83
    .line 84
    .line 85
    :cond_4
    return v4

    .line 86
    :cond_5
    :goto_3
    invoke-super {p0, p1}, Landroid/widget/EditText;->onTextContextMenuItem(I)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    return p0
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll7;->j:Ls3;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ls3;->n()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setBackgroundResource(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll7;->j:Ls3;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ls3;->o(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll7;->k:Lp8;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lp8;->b()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll7;->k:Lp8;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lp8;->b()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V
    .locals 0

    .line 1
    invoke-static {p1, p0}, Lst;->x(Landroid/view/ActionMode$Callback;Landroid/widget/TextView;)Landroid/view/ActionMode$Callback;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-super {p0, p1}, Landroid/widget/TextView;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setEmojiCompatEnabled(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll7;->n:Ls7;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ls7;->H(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setKeyListener(Landroid/text/method/KeyListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll7;->n:Ls7;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ls7;->w(Landroid/text/method/KeyListener;)Landroid/text/method/KeyListener;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-super {p0, p1}, Landroid/widget/TextView;->setKeyListener(Landroid/text/method/KeyListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll7;->j:Ls3;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ls3;->t(Landroid/content/res/ColorStateList;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll7;->j:Ls3;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ls3;->u(Landroid/graphics/PorterDuff$Mode;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSupportCompoundDrawablesTintList(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll7;->k:Lp8;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lp8;->l(Landroid/content/res/ColorStateList;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lp8;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setSupportCompoundDrawablesTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll7;->k:Lp8;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lp8;->m(Landroid/graphics/PorterDuff$Mode;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lp8;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final setTextAppearance(Landroid/content/Context;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll7;->k:Lp8;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Lp8;->g(Landroid/content/Context;I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setTextClassifier(Landroid/view/textclassifier/TextClassifier;)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-ge v0, v1, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll7;->l:Ls7;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iput-object p1, v0, Ls7;->l:Ljava/lang/Object;

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    :goto_0
    invoke-direct {p0}, Ll7;->getSuperCaller()Lk7;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lk7;->a:Ll7;

    .line 20
    .line 21
    invoke-super {p0, p1}, Landroid/widget/EditText;->setTextClassifier(Landroid/view/textclassifier/TextClassifier;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
